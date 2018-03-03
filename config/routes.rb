Rails.application.routes.draw do

  devise_for :users
  root 'movies#index'
  resources :movies 
  resources :accounts 
  scope'movies/:movie_id', as: 'movie' do 
    resources :comments, only: [:new, :create]
  end 
  
end
