Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/update'
  resources :girls do
    resources :posts
  end
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dashboard do
    resources :girls
  end
end

