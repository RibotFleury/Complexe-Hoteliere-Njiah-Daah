Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/success'
  get 'reservations/new'
  get 'reservations/confirm'
  get 'reservations/success'
  get 'services/index'

  devise_for :users
  root to: "pages#home"

  resources :reservations, only: [:new, :create]
  get 'reservations/confirm', to: 'reservations#confirm', as: 'confirm_reservations'
  get 'reservations/success', to: 'reservations#success', as: 'success_reservations'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
