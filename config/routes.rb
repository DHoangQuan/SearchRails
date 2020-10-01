Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'developers#index'  
  namespace :api do
    namespace :v1 do 
      # get "/developers", to: 'developers#index'
      # get '/404', to: 'errors#not_found'
      resources :developers
      
    end
  end
  resources :developers, only: :index
  # match '*a', :to => 'errors#routing'
end
