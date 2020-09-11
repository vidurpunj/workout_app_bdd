Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
  resources :users do
    resources :exercises
  end

  get :exercises_in_7_days, to: 'charts#exercises_in_7_days', as: :exercises_in_7_days

end
