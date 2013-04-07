Venkman::Application.routes.draw do
  devise_for :users

  namespace :v1 do
    devise_scope :user do
      resource :sessions, only: [:create, :destroy]
      resource :registrations, only: [:create]
    end

    resources :users, only: [:show, :destroy] do
      resources :messages, except: [:create, :update]
    end
  end

  match 'server_status', controller: 'application', action: 'server_status'

  match '*path', controller: 'application', action: 'server_status',
    constraints: { method: 'OPTIONS' }
end
