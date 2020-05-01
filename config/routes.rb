Rails.application.routes.draw do
  resources :questions do
  	member do
    	get 'follow_topic'
      get 'follow_user'
  	end
  end
  devise_for :users

  devise_scope :user do
	  authenticated :user do
	    root 'questions#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
  end
end
