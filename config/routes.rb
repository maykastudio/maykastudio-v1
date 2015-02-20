Rails.application.routes.draw do
  namespace :admin do
    resources :gallery

    root :to => 'gallery#index'
  end

  root :to => 'welcome#index'
end
