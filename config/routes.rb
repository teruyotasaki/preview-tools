Rails.application.routes.draw do
  root             'indexes#home'

  get 'treasuredatatags' => 'treasuredatatags#home'
#  get 'treasuredatatags/view'
  post 'treasuredatatagsview' => 'treasuredatatags#view'
#  get 'treasuredatatags/downloadcsv/download'=> 'treasuredatatags#downloadcsv'

  get 'placementtags' => 'placementtags#home'
#  get 'placementtags/view'
  post 'placementtagsview' => 'placementtags#view'
  get 'placementtags/downloadcsv/download'=> 'placementtags#downloadcsv'

  get 'url_checker/index'
  post 'url_checker/index'

  get 'image_test/index'
  post 'image_test/index'

end
