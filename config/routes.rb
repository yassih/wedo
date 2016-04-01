Rails.application.routes.draw do

  get 'calendar/index' => 'calendar#index'

  get '/shared_lists/share_the_list' => 'shared_lists#share_the_list'
  resources :shared_lists
  resources :notes
  resources :categories
  resources :lists
  resources :items
  devise_for :users
  resources :users, only: [:show, :index]

  root 'lists#index'
  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      put :accept
    end
  end

end
