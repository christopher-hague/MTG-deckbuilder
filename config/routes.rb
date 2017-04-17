Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:destroy]
  delete '/users/:id', to: 'users#delete', as: :delete_user
end
