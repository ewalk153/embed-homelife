Rails.application.routes.draw do
  resources :observations do
    collection do
      get :last
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
