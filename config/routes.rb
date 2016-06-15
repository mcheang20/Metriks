Rails.application.routes.draw do
  devise_for :users
  resources :apps do
    resources :events, except: [:index]
  end
  get 'welcome/home'
  root 'welcome#home'
end
