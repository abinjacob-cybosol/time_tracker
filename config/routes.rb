Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "dashboard#index"
  resources :projects, :only => [:index, :show]
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
