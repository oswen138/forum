Rails.application.routes.draw do
  
  resources :channels
  resources :discussions do
    resources :replies
  end

  resources :conversations do
    resources :messages
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'discussions#index', as: :subdomain_root
  get 'messages', to: 'messages#index', as: :messages_root
  get 'conversations', to: 'conversations#index', as: :conversations_root
  
end
