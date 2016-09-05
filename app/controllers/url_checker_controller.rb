class UrlCheckerController < ApplicationController
  require 'net/http'

  def index
    if params[:urllist].nil?
      return
    end
    @result = []
    count=0
    @urllist = params[:urllist]
    @urllist.split("\n").each do |line|
      url = line.chomp.gsub(/^\s+/, "")
      next if url == ""
      result = {:url => url}
      @result << result
      next if testUrl(url, result) == false
      if count > 100
	result[:message] = "URL Check is up to 100"
	result[:status] = :error
	next
      end
      count+=1
      testGet(url, result)
    end
  end


  private

  def parse_uri(url)
    begin
      return URI.parse(url)
    rescue URI::InvalidURIError => e
      raise ArgumentError, "#{url} = #{e.to_s}"
    end
  end

  def testUrl(url, result)
    begin
      uri = parse_uri(url)
    rescue ArgumentError => e
      result[:status] = :error
      result[:message] = e.to_s
      return false
    end

    if uri.class != URI::HTTP and uri.class != URI::HTTPS
      result[:status] = :error
      result[:message] = "URL is not HTTP or HTTPS"
      return false
    end


    if uri.query.nil?
      return true
    end
    result[:queries] = {}
    errorcount = 0
    URI::decode_www_form(uri.query).each do |v|
      if ! result[:queries][v[0]].nil?
	result[:message] ||= ""
	result[:message] += "Query string key \"#{v[0]}\" duplicated.\n"
	errorcount += 1
      end
      result[:queries][v[0]] = v[1]
    end
    return false if errorcount > 0
    return true
  end

  def testGet(url, result)
    begin
      res, final_uri = fetch_url(parse_uri(url))
    rescue ArgumentError => e
      result[:status] = :error
      result[:message] = e.to_s
      return false
    rescue Errno::ECONNRESET => e
      result[:status] = :unknown
      result[:message] = e.to_s
      return false
    end

    result[:final_url] = final_uri.to_s
    result[:message] = "HTTP Response=#{res.code} #{res.message}"

    result[:show_iframe] = final_uri.class == URI::HTTPS or !request.ssl?
    case res
    when Net::HTTPSuccess
      result[:status] = :ok
      return true
    else
      result[:status] = :error
      return false
    end
  end

  def fetch_url(uri, limit = 3)
    raise ArgumentError, 'HTTP Redirect too deep. Up to 3' if limit == 0

    res = Net::HTTP.get_response(uri)
    case res
    when Net::HTTPRedirection
      desturi = parse_uri(res['location'])
      # if "Location: /", should fill scheme and host
      if desturi.host.nil?
	desturi.host = uri.host
      end 
      if desturi.scheme.nil?
	desturi.scheme = uri.scheme
	desturi = URI.parse(desturi.to_s)
      end 
      
      return fetch_url(desturi, limit - 1)
    end
    return res, uri
  end

  def set_status(resultSet, value)
    resValueOrder = [:ok, :unknown, :error]
  end

end
