Rails.application.routes.draw do
  get 'search', to: "tags#search"
   
  root to: "pages#home"
  get '/about_us', to: "pages#about_us"
  get '/sign-up', to: "users#new"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :users, except: [:new]
  resources :templates
  resources :tags
end
