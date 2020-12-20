Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :channels
  resources :discussions do
    resources :replies

  resources :conversations do
    resources :messages
    end
  end
end