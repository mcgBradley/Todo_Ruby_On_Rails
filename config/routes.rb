Rails.application.routes.draw do
  root to: "todos#index"

  resources :todos, only: [:index, :new, :create] do
    resource :completion, only: [:create, :destroy]
  end

  get "/todos/:sort", to: "todos#index"

  resource :session, only: [:new, :create]
end
