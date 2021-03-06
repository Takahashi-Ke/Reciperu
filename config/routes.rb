Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'users#top'
   
   
   
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
  end
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
end
