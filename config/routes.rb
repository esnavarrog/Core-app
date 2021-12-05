Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/update'
  post 'comment_new', to: 'comments#create'
  resources :girls do
    resources :posts do
      resources :comments, only: [:create]
    end
  end
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dashboard do
    resources :girls
  end
end

