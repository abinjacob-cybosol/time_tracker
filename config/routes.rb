Rails.application.routes.draw do
  get 'task/index'

  get 'task/create'

  get 'task/show'

  get 'task/edit'

  get 'task/update'

  get 'task/destroy'

  get 'project/index'

  get 'project/create'

  get 'project/show'

  get 'project/edit'

  get 'project/update'

  get 'project/destroy'

  get 'dashboard/index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "dashboard#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
