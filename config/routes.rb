Venkman::Application.routes.draw do
  devise_for :users, skip: :sessions

  namespace :v1 do
    resources :users, except: [:index] do
      resources :messages, except: [:create, :update]
    end
  end
end
