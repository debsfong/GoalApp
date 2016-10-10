Rails.application.routes.draw do
  get 'goals/new'

  get 'goals/edit'

  get 'goals/show'

  resources :users
  resource :session
end
