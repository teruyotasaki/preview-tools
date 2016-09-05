module ImageTestHelper
#  require 'RMagick'
  def imagefileinfo(imgblob)
    @img = Magick::ImageList.new
    @img.from_blob(imgblob)
    vars = {
      width: @img[0].base_columns,
      height: @img[0].base_rows,
      type: @img.format,
      base64:
      "data:image/#{@img.format.downcase};base64,#{Base64.strict_encode64(imgblob)}"
    }
    if @img.format == 'GIF'
      vars[:transparent] = @img[0].alpha?
    elsif @img.format == 'PNG'
      vars[:channel_depth] = @img[0].channel_depth
      vars[:transparent] = @img[0].channel_depth(Magick::AlphaChannel) > 1
    else
      vars[:transparent] = false
    end

    if @img.format != 'GIF'
      vars[:animation_seconds] = 'None'
    elsif 
      total = 0.0
      @img[0].iterations == 0
      @img.each do |i|
        total += i.delay.to_f / i.ticks_per_second.to_f
      end
      if @img[0].iterations == 0
	vars[:animation_seconds] = "Infinity : #{total} sec * Inifinity"
      else
        vars[:animation_seconds] =  "#{total * @img[0].iterations}" +
       	  " = #{total} sec * #{@img[0].iterations} times"
      end
    end

    return vars
  end

  def testImageWidthHeight(fileinfo, testCases)
    res = {
      :name => "Width Height",
      :result => false,
      :message => "#{fileinfo[:width]}x#{fileinfo[:height]} doesn't match any test cases"
    }
    testCases.each do |tc|
      if fileinfo[:width] == tc[:width] and fileinfo[:height] == tc[:height]
	res[:message] = "Matched to #{tc[:width]}x#{tc[:height]}"
	res[:result] = true
	return res
      end
    end
    return res
  end
end
