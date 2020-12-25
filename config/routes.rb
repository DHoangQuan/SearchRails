Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'developers#index'  
  namespace :api do
    namespace :v1 do 
      resources :developers
    end
  end
  resources :developers, only: [:index] do
    collection do
      get :export_csv
    end
  end
end
