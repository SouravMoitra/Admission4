Rails.application.routes.draw do
-#***************************************************************************#
-#   Created by : Sourav Moitra                                              #
-#   email : astrosourav@gmail.com                                           #
-#   License : The MIT License (MIT)                                         #
-#   Date : October 5th 2014                                                 #
-#***************************************************************************#

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get '/verify' => 'vusers#index'


  resources :streams
  resources :subjects, except: [:show]
  resources :sub_str_maps, except: [:show]
  resources  :academics, only: [:new, :create]
  resources :personals, only: [:new, :create]
  resources :stream_selectors, only: [:new, :create]

  devise_for :users
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
    delete "sign_out", to: "devise/sessions#destroy"
  end
end
