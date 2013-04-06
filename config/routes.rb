Venkman::Application.routes.draw do
  devise_for :users, skip: :sessions

  namespace :v1 do
    resources :users, except: [:index] do
      resources :messages, except: [:create, :update]
    end
  end

  match '*path', :controller => 'application', :action => 'server_status',
    :constraints => {:method => 'OPTIONS'}
end
