Rails.application.routes.draw do
  post 'auth/login', to: 'authentications#login'
  get '/*a', to: 'application#not_found'
end
