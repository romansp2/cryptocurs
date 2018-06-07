class Currency < ApplicationRecord
  validates :code, uniqueness: true,presence: true
  has_many :pairs

end
