Rails.application.routes.draw do
  
  resources :channels
  resources :discussions do
    resources :replies
  end

  resources :conversations do
    resources :messages
  end

  root 'discussions#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  
end
