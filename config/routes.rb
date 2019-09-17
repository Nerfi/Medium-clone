Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :articles do
    resources :reviews, only: :create
  end

  #adding routes for following actions
  resources :users, only: [:index] do
    member do
      post :follow
      post :unfollow
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
