Rails.application.routes.draw do
  root to: 'home#index'

  get '/', to: 'home#index'
  get 'turbolinks.js', to: 'home#turbolinks'

  resources :sessions
  resources :profile, only: :index do
    collection do
      get :edit
    end
  end
end
