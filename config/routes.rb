Rails.application.routes.draw do

  get '/register'  => 'register#index'
  post '/register' => 'register#create'
  post '/session'  => 'session#create'
  delete '/logout' => 'session#delete'
  post '/home'     => 'home#index'
  post '/messages' => 'messages#create'
  get '/messages/:id'  => 'messages#check'
  get '/messages/more/:count'  => 'messages#more'
  get '/users/check'  => 'users#check'

  resources :users, only: [:index, :show]

  namespace :admin do
    get '/dashboard' => 'dashboard#index'

    resources :users
    resources :messages, only: [:index, :show]
  end

  root 'welcome#index'

end



#table_name: users
#model_name: User
#routes:

#  GET /users          ----> list many users
#  POST /users         ----> create user
#  GET /users/ID       ----> show 1 user
#  GET /users/ID/edit  ----> edit 1 user
#  PUT /users/ID       ----> update 1 user
#  DELETE /users/ID    ----> delete 1 user
