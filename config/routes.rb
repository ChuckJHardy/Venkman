Venkman::Application.routes.draw do
  devise_for :users

  namespace :v1 do
    resources :users
  end
end
