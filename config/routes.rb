Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jokes#index'
  resources :jokes, only: [:index] do
    collection do
      get :fetch_new_record
      get :refresh
    end
  end

end
