Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :favorites, only: [:index ,:create, :destroy]
    get "follow_list" => "users#follow_list"
    get "follower_list" => "users#follower_list"
  end
  resources :relationships, only: [:create, :destroy]
  resources :impressions, only: [:index, :show, :create, :destroy] do
    resources :post_impressions, only: [:create, :destroy]
  end
  get "search_content" => "impressions#search_content"
  get "search" => "searches#search"
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy',as: 'destroy_favorite'
  root to: 'impressions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end