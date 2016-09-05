class ImageTestController < ApplicationController
  include ImageTestHelper

  def index
    @option_size = 
    [[300, 250], [728, 90], [468, 60], [160, 600], [120, 600], [300, 600],
     [160, 160], [320, 50], [320, 100], [1200, 628], [1200, 675], [300, 300],
     [1280, 720], [600, 500], [200, 200], [336, 280], [250, 250], [970, 50],
     [360, 600], [800, 200], [800, 320], [600, 315], [600, 600], [1936, 1936]
    ].sort do |a,b|
      r = a[0] <=> b[0]
      if r == 0
        r = a[1] <=> b[1]
      end
      r
    end.map do|v|
      v.join("x")
    end

    return unless request.post? 

    @testSizes = []
    @choisenSizes = {}
    if params[:sizes].size == 0
      raise "Size is not selected"
    end
    params[:sizes].each do |wh, val|
      next if val != "1"
      @choisenSizes[wh] = true
      w, h = wh.split("x").map{|v| v.to_i}
      @testSizes.push({:width => w, :height => h})
    end

    @test_upper_kb = @test_transparent = nil
    @imagesizes_txt = params[:imagesizes_txt]
    @imagesizes_txt.split("\s").each do |wh|
      w, h = wh.split("x").map{|v| v.to_i}
      @testSizes.push({:width => w, :height => h})
    end

    if params[:upper_kilobytes].to_i > 0
      @test_upper_kb = params[:upper_kilobytes].to_i
    end
    if params[:allow_transparent] != "checked"
      @test_transparent = true
    end

    @imageInfos = []
    params[:images].each do |file|
      v = imagefileinfo(file.read)
      v[:original_filename] = file.original_filename
      v[:size] = file.size / 1024 + (file.size % 1024 > 0 ? 1 : 0)
      v[:tests] = []
      #v[:test_failed] = 0

      v[:tests].push( testImageWidthHeight(v, @testSizes) )

      if @test_upper_kb
	res = {
	  :name => "File size",
	  :message => "Actual=#{v[:size]}KB, Assumed=#{@test_upper_kb}KB",
	  :result => v[:size] <= @test_upper_kb
	}
	v[:tests].push( res )
      else
	v[:tests].push({:name => "File size", :result => :neutral})
      end

      if @test_transparent
	testres = v[:transparent] != true
	res = {
	  :name => "Transparent", 
	  :result => v[:transparent] != true,
	}
	res[:message] = "Actual=" + 
	  (v[:transparent] ? "Transparent" : "Not Transparent")
      else
	v[:tests].push({:name => "Transparent", :result => :neutral})
      end
      @imageInfos.push(v)
    end
  end
end
