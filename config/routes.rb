Rails.application.routes.draw do
  root  "pages#home"
  get   "pages/home",   to: "pages#home"

  resources :recipes
  get "/signup",  to: "cooks#new"
  resources :cooks, except: [:new]
end
