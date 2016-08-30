class PlacementtagsController < ApplicationController
  def home
  end

  def view
  end

  def downloadcsv
    file_name="sample.csv"
    filepath = Rails.root.join('public',file_name)
    stat = File::stat(filepath)
    send_file(filepath, :filename => file_name, :length => stat.size)
  end

end
