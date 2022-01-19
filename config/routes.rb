Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/update'
  post 'comment_new', to: 'comments#create'
  resources :girls, path:'chicas'
  resources :inscriptions
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
  post 'poly_likes', to: 'poly_likes#create'
  post 'create_post', to: 'posts#create'
  post 'delete_like', to: 'poly_likes#delete_like'
  get 'see_comments', to: 'comments#see_comments'
  get 'all_comments', to: 'comments#all_comments'
  get 'formulary_inscription', to:'girls#formulary_inscription'
  get 'see_reply', to: 'comments#see_reply'
  get 'reply', to: 'comments#reply'
  get 'input_modal', to: 'comments#input_modal'
end

