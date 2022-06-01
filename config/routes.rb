Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  resources :events do
    collection do
      get 'past'
      get 'future'
    end
  end
  resources :users
  resources :attendances

end
