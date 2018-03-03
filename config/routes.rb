Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :movies 

  scope'movies/:movie_id', as: 'movie' do 
    resources :comments, only: [:new, :create]
  end 
  
end
