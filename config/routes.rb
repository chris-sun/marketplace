Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             :path => '',
             :path_names => {
               :sign_in => 'login',
               :sign_out => 'logout',
               :edit => 'profile'},
             :controllers => {
               :omniauth_callbacks => 'omniauth_callbacks',
               :registrations => 'registrations'
               
             }

  resources :services do
    resources :orders, only: [:create]
    resources :reviews, only: [:create, :destroy]
    collection do
      get 'all'
    end
  end

  resources :charges
  resources :orders, only: [:show]

  # These are hacks.  Should use a nested resource
  # resources :users do
  #   member 'orders'
  # end
  get '/user_orders'=> 'orders#user_orders'
  get '/user_sales'=> 'orders#user_sales'
  get '/search', to: 'search#search'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

end
