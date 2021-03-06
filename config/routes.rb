Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations',
    omniauth_callbacks: 'omniauth'
  }
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/update'
  post 'comment_new', to: 'comments#create'
  resources :inscriptions
  resources :posts, path:"publicaciones"
  resources :girls, path:'chicas' do
    resources :bits
    resources :posts do
      resources :comments, only: [:create]
    end
  end
  resources :comments
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dashboard do
    resources :girls
  end
  resources :payments, path:"pagos"
  get 'payments/payment_success', as: :payment_success
  get 'payments/payment_failed', as: :payment_failed
  get 'mis_chicas', to:'girls#mis_chicas'
  post 'poly_likes', to: 'poly_likes#create'
  post 'create_post', to: 'posts#create'
  post 'delete_like', to: 'poly_likes#delete_like'
  get 'see_comments', to: 'comments#see_comments'
  get 'all_comments', to: 'comments#all_comments'
  get 'formulary_inscription', to:'girls#formulary_inscription'
  get 'see_reply', to: 'comments#see_reply'
  get 'reply', to: 'comments#reply'
  get 'input_modal', to: 'comments#input_modal'
  get 'terms/terms_and_conditions', as: :terms_and_conditions
  get 'terms/politics_of_use', as: :politics_of_use
  get '/auth/facebook/callback', to: 'omniauth_callbacks#facebook'
  post 'pay_post', to:'posts#pay_post'
  get 'look', to: 'posts#look'
  get 'bit_of_post', to: 'bits#bit_of_post', as: :bits_de_publicacion

  #WebPay 
  get '/webpay/webpay_final_url', :to => 'webpay#webpay_final_url'
  # post '/webpay/webpay_return_url', :to => 'webpay#webpay_return_url', :as => :webpay_return_url
  # get '/webpay/webpay_return_url', :to => 'webpay#webpay_return_url'
  post '/pagos/success_final', :to => 'payments#success_final', :as => :success_final
  get 'pagos/success', :to => 'payments#pay_success', :as => :pay_success
  get 'pagos/pago_realizado', to: 'payments#pay_aproved', as: :pago_realizado
  get 'pagos/pago_rechazado', to: 'payments#pay_rejected', as: :pago_rechazado
  get 'webpay/error', :to => 'payments#webpay_error', :as => :webpay_error
  get 'webpay/nullify', :to => 'payments#webpay_nullify', :as => :webpay_nullify
end

