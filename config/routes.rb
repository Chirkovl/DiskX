Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'disks#index'
  resources :disks
end
