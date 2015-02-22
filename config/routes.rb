Rails.application.routes.draw do
  devise_for :users

  namespace :manage do
    resources :gallery do
      resources :images, :except => [:index, :show] do
        post 'sort' => 'images#sort', :on => :collection, :as => :sort
      end
    end

    root :to => 'gallery#index'
  end

  resources :gallery, :only => [:index, :show]

  root :to => 'gallery#index'
end
