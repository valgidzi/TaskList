Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  # get '/tasks/:id', to: 'tasks#show'
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  patch '/tasks/:id', to: 'tasks#update'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'

  get '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete_task'

  delete '/tasks/:id', to: 'tasks#destroy'


end
