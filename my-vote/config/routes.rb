Rails.application.routes.draw do
  resources :users
 resources :candidates do
      post :vote, on: :member

    end
     
end
