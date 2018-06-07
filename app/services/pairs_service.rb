require 'uri'
require 'net/http'

class PairsService
  class << self
    def pairs_first_init
      url = "https://api.bitfinex.com/v1/symbols"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      res = JSON.parse(response)

      res.each {|pair|
        new_pair = Pair.new
        new_pair.code = pair.to_s.upcase!
        code = pair.last(3)
        new_pair.currency = Currency.find_by_code(pair.last(3))
        new_pair.save!
      }
    end

    def update
      pairs_data = data_init gen_symbols
      pairs_data.each{|data|
        pair = Pair.find_by_code(cut_symbol data[0])
        pair.bid = data[1]
        pair.bid_size = data[2]
        pair.ask = data[3]
        pair.ask_size = data[4]
        pair.daily_change = data[5]
        pair.daily_change_perc = data[6]
        pair.last_price = data[7]
        pair.volume = data[8]
        pair.high = data[9]
        pair.low = data[10]
        pair.save!
      }
    end

    private

    def gen_symbols #создает массив символов криптопары для отправки API
      symbols = String.new
      Pair.all.each{|pair|
        symbols << "t"
        symbols << pair.code
        symbols << ","
      }
      symbols
    end

    def cut_symbol(symbol)
      symbol.delete"t ,"
    end

    def data_init(symbols) #получаем массив криптопар с массивом инфо о них
      url = "https://api.bitfinex.com/v2/tickers?symbols=#{symbols}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      res = JSON.parse(response)
      res


    end

  end
end