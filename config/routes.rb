Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:create]
 
  resources :tasks, only: [:index, :create] do
    resource :task_completion, only: [:create]
  end

  get "/sign_up" => "users#new", as: :sign_up
  get "/sign_in" => "sessions#new", as: :sign_in

  root "tasks#index"
end
