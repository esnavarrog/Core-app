Rails.application.routes.draw do
  resources :girls
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :dashboard do
    resources :girls
  end
end

