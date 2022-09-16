Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'cats#index'
  resources :cats,  only: [:index, :show, :create, :update, :edit, :new]
  
end
