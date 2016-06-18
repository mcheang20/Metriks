Rails.application.routes.draw do
  devise_for :users
  resources :apps do
    resources :events, except: [:index]
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
  get 'welcome/home'
  root 'welcome#home'
end
