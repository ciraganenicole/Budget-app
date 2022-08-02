# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'categories#index'
  resources :categories, only: %i[index show create new destroy update] do
    resources :transancts, only: %i[index show create new destroy update]
  end
end