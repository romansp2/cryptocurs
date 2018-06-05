class CryptoCursController < ApplicationController
  def index
    @response = BitfinexService.int_currency
  end
end
