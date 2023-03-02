Rails.application.routes.draw do
  resources :tags
  root to: "pages#home"
  get '/about_us', to: "pages#about_us"
  resources :templates
end
