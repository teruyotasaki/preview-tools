class TreasuredatatagsController < ApplicationController
  def home
  end

  def view
    if params["tablename"].nil? || params["tablename"].empty? then
      @errormsg = "テーブルを選択してください。"
      render 'home'
    elsif params["tag"].nil? || params["tag"].empty? then
      @errormsg = "計測種別を選択してください。"
      render 'home'
    end
  end
end
