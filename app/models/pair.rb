class Pair < ApplicationRecord
  belongs_to :currency
  validates :code, uniqueness: true,presence: true
  has_many :pair_candles

end
