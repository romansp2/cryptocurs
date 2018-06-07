require 'uri'
require 'net/http'

class PairCandlesService
  class << self

    def pairs_first_init pair_id
      get_pair_hist Pair.find(pair_id)

    end


    def graph_data candles
      data = Hash.new
      candles.each{|candle|
        time = Time.at( candle.mts / 1000 )
        data.store(time.to_s, candle.close)
      }
      data
    end

    private
    def get_pair_hist pair
      symbol = pair.code
      url = "https://api.bitfinex.com/v2/candles/trade:12h:t#{symbol}/hist"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      res = JSON.parse(response)

      res.each {|hist|
        new_hist = PairCandle.new
        new_hist.pair = pair
        new_hist.code = pair.code
        new_hist.mts = hist[0]
        new_hist.open = hist[1]
        new_hist.close = hist[2]
        new_hist.high = hist[3]
        new_hist.low = hist[4]
        new_hist.volume = hist[5]
        new_hist.save!
      }
    end

  end
end