Rails.application.routes.draw do
  resources :todos do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end

  root "todos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
