Rails.application.routes.draw do
  resources :pictures, except: [:destroy] do 
    resources :votes, only: [:create, :update, :destroy]
    resources :saved_pictures, only: [:new, :create]
  end

  resources :users, except: [:new, :create] do
    resources :boards do 
      resources :saved_pictures, only: [:destroy]
    end

    resources :pictures, only: [:index]
  end


  get     '/register',                                            to: 'users#new'
  post    '/register',                                            to: 'users#create'

  get     '/',                                                    to: 'sessions#new'
  get     '/login',                                               to: 'sessions#new'
  post    '/login',                                               to: 'sessions#create'
  delete  '/logout',                                              to: 'sessions#destroy'

  #get     'user/:user_id/uploaded',                               to: 'pictures#uploaded'

  #get     '/picture/:picture_id/save',                            to: 'saved_pictures#new'
  #post    '/picture/:picture_id/save',                            to: 'saved_pictures#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
