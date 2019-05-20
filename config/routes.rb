# frozen_string_literal: true

Rails.application.routes.draw do
  get 'studio/index'
  get 'artist/index'
  #  devise_for :engineers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'zats/index'
  get 'zats/:id/edit', to: 'zats#edit', as: :edit_zat
  patch 'zats/:id', to: 'zats#update'
  # post 'zats/new', to: 'zats#new'
  get 'engineers/:id', to: 'engineers#show', as: 'engineer'

  resources :zats

  resources :artists # , :videos
  resources :studios

  resources :engineers do
    resources :zats
  end
  # get 'engineers/:id/zats/:zats_id'

  devise_for :engineers, controllers: { omniauth_callbacks: 'engineers/omniauth_callbacks', registrations: 'registrations' }
end
