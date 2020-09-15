Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
  resources :users do
    resources :exercises
  end
  resources :dashboard, only: :index do
    collection do
      post :search, to: 'dashboard#search'
      get :search, to: 'dashboard#search'
    end
  end
  get :exercises_in_7_days, to: 'charts#exercises_in_7_days', as: :exercises_in_7_days

end
