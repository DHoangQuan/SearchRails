Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'developers#index'  
  namespace :api do
    namespace :v1 do 
      get "/developers", to: 'developers#index'
    end
  end
  resources :developers, only: :index
end
