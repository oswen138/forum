Rails.application.routes.draw do
  
  root 'discussions#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :channels
  resources :discussions do
    resources :replies

  resources :conversations do
    resources :messages
    end
  end
end

resources :posts do
  collection do
    get 'hobby'
    get 'study'
    get 'team'
  end
end