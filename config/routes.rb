Rails.application.routes.draw do
  get 'pair_candles/index'

  get 'pairs/show'

  root 'crypto_curs#index'

  resources :pairs

  resources :pairs do
    resources :pair_candles, only: [:index]
  end


end
