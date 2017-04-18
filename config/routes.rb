Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/', to: 'users#home'
  resources :users


  resources :cards, only: [:show, :index]
  patch '/cards/:id', to: 'cards#deck'


  resources :decks, only: [:new, :create, :show]
  patch '/decks/:id', to: 'decks#update', as: :update



  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
