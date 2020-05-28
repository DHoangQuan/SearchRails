Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'developer_languages#index'  
  resources :developers
  resources :languages
  resources :programming_languages
  resources :developer_programming_languages
  resources :developer_languages
end
