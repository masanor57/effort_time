Rails.application.routes.draw do
 root 'homes#top'
 devise_for :users
 get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users, only: [:index, :show, :edit, :update]
 resources :reports, only: [:index, :show, :edit, :create, :destroy, :update]



end

