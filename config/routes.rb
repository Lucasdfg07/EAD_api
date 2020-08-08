Rails.application.routes.draw do
  
  namespace :api do
    resources :classes, controller: :teacher_classes
    resources :connections
  end
end
