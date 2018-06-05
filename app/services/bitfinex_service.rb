require 'uri'
require 'net/http'

class BitfinexService
  class << self
    def get_pairs
    url = "https://api.bitfinex.com/v1/symbols"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    res = JSON.parse(response)
    end

    def int_currency
      currency_codes = Array.new
      get_pairs.each{|pair|
      currency_codes << pair.last(3)
      }
      currency_codes.uniq!
    end

  end
end