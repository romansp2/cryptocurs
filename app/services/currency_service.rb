require 'uri'
require 'net/http'

class CurrencyService
  class << self

    def currencies_first_init
      url = "https://api.bitfinex.com/v1/symbols"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      res = JSON.parse(response)
      currencies = Array.new
      res.each {|pair|
        currencies << pair.last(3)
      }
      currencies.uniq!
      currencies.each{|currency|
        new_currency = Currency.new
        new_currency.code = currency
        new_currency.save!
      }
    end


  end
end