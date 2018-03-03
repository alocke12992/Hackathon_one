Rails.application.routes.draw do

  get 'playlists/index'

  get 'playlists/show'

  get 'playlists/new'

  get 'playlists/edit'

  devise_for :users
  root 'movies#index'

  resources :movies
  # resources :comments
  resources :accounts

  resources :accounts do
    member do
      get :add_comment
      get :add_comment_to_account
    end
  end

  # scope'movies/:movie_id', as: 'movie' do
  #
  #   resources :comments, only: [:new, :create]
  # end

  resources :movies do
    resources :comments
  end

end
