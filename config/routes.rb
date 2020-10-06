Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'developers#index'  
  namespace :api do
    namespace :v1 do 
      # get "/developers", to: 'developers#index'
      # get '/404', to: 'errors#not_found'
      resources :developers
      # devise_scope :user do
      #   post "sign_up", to: "registrations#create"
      #   post "sign_in", to: "sessions#create"
      # end
    end
  end
  resources :developers, only: :index
  # match '*a', :to => 'errors#routing'
end
