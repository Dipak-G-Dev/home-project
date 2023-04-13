Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get 'clock_in/:user_id', to: 'sleeps#index'
    get 'friends_sleep_record/:user_id', to: 'sleeps#friends_record'
    post 'clock_in' , to: 'sleeps#create'
    get 'followee/:id' ,to: 'follows#followees'
    get 'followers/:id', to: 'follows#followers'
    post 'follow', to: 'follows#create'
    delete 'unfollow/:id/:followee_id', to: "follows#destroy"
  end
end
