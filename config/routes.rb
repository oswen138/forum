Rails.application.routes.draw do
  
  root 'discussions#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :channels
  resources :discussions do
    resources :replies

  namespace :private do 
    resources :conversations, only: [:create] do
      member do
        post :close
      end
    end
    resources :messages, only: [:index, :create]
  end
  
end

