Rails.application.routes.draw do
  devise_for :users
  resources :apps
  get 'welcome/home'
  root 'welcome#home'
end
