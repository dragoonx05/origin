Rails.application.routes.draw do
  

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :edit, :show, :update] do #remove controller: "users" and add :edit inside [:create] to let google oauth to create user and update passwords at own database
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  root "static#index"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
  resources :listings do 
    resources :reservations
  end

  get '/reservation/:reservation_id/braintree/new' => "braintree#new", as: "braintree_new"
  post '/reservation/:reservation_id/braintree/checkout' => "braintree#checkout", as: "braintree_checkout"



  # get "/listings" => "listings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
