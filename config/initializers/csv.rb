#
# Shift-JISなCSVを読み込む・書き出しするときにエラーを起こさない数少ない方法
# http://qiita.com/yuuna/items/7e4e06a1b881d85697e9
#

module CSVEncodingExtension
  def initialize(data, options = Hash.new)
    options.delete(:replace)
    options.delete(:undef)
    super
  end
end

CSV.send(:prepend, CSVEncodingExtension)