Rails.application.routes.draw do
  devise_for :usuarios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :empresas, only: %i[index show] 
  
end
