Rails.application.routes.draw do
  resources :users, param: :_username
  post 'auth/login', to: 'authentications#login'
  get '/*a', to: 'application#not_found'
end
