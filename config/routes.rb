Rails.application.routes.draw do
  namespace :manage do
    resources :gallery do
      resources :images, :except => [:index, :show]
    end

    root :to => 'gallery#index'
  end

  resources :gallery, :only => [:index, :show]

  root :to => 'gallery#index'
end
