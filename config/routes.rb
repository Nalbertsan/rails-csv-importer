Rails.application.routes.draw do
  resources :products, only: [] do
      collection do
        get :upload
        post :import
      end
    end

    root "products#upload"
end
