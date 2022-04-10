Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :connecthions, only: [:create, :destroy]
    get 'followings' => 'connecthions#followings', as: 'followings'
    get 'followers' => 'connecthions#followers', as: 'followers'
  end
  resources :post_impressions, only: [:create]
  resources :impressions, only: [:show, :create] do
    collection do
      get 'search'
    end
  end
  resources :tags, only: [:index,:show]
  root to: 'impressions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end