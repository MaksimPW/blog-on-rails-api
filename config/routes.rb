Rails.application.routes.draw do

  resources :posts do
    patch :add_like, on: :member
  end
end
