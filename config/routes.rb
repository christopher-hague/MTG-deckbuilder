Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/', to: 'users#home'
  resources :users


  get '/cards/search', to: 'cards#search', as: :search
  get '/cards/search_results', to: 'cards#search_results', as: :search_result
  resources :cards, only: [:show, :index]
  patch '/cards/:id', to: 'cards#deck'


  resources :decks, only: [:new, :create, :show]
  patch '/decks/:id', to: 'decks#update', as: :update



  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
