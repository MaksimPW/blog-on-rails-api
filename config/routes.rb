Rails.application.routes.draw do

  resources :posts, only: [:index, :show] do
    patch :add_like, on: :member
  end
end
