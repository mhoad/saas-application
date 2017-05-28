# frozen_string_literal: true

require 'constraints/subdomain_required'

Rails.application.routes.draw do
  devise_for :users

  constraints(SubdomainRequired) do
    scope module: 'accounts' do
      root to: 'widgets#index', as: :account_root
      resources :widgets
      resources :invitations, only: %i[new create]
    end
  end

  root to: 'home#index'
  get '/accounts/new', to: 'accounts#new', as: :new_account
  post '/accounts', to: 'accounts#create', as: :accounts
  get '/_ah/health', to: 'home#health_check'
end
