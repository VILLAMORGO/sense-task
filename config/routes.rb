Rails.application.routes.draw do
  devise_for :accounts
  resources :tasks do
    member do
      patch :update_status
    end
  end
  resources :categories
  
  get '/show_task/:id', to: 'tasks#show', as: 'show_task'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
