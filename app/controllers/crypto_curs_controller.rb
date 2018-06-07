class CryptoCursController < ApplicationController
  def index
    if Currency.all.empty?
      CurrencyService.currencies_first_init
    end

    if Pair.all.empty?
      PairsService.pairs_first_init
      PairsService.update

    else
      time = Pair.order(:created_at).last.created_at.to_datetime

      if time.strftime("%B %d, %Y") < DateTime.now.strftime("%B %d, %Y")
        Pair.each{ |pair| pair.destroy }
        PairsService.update
      end

    end

    @currencies = Currency.all

  end
end
