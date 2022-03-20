Rails.application.routes.draw do
  resource :session
  resources :password_resets
  resources :users, param: 'name'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'

  inertia 'invest' => 'static/invest'

  scope '/:name' do
    get '/', to: 'users#show'
  end  

  inertia '/' => 'static/invest'
end
