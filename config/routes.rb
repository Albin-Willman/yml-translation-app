Rails.application.routes.draw do
  namespace :api do
    get 'translations', to: 'translation_strings#index'
    post 'translations', to: 'translation_strings#update'
    post 'translations/uploadYML', to: 'translation_strings#uploadYML'
    namespace :users do
      post 'login'
      get 'verify'
      delete 'logout'
    end 
    get 'languages', to: 'languages#index'
  end
end
