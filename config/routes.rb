Rails.application.routes.draw do
 root 'homes#top'
 devise_for :users
 get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings'
  get 'followers' => 'relationships#followers'
  end

 resources :reports, only: [:index, :show, :edit, :create, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :report_comments, only: [:create, :destroy]
 end


end

