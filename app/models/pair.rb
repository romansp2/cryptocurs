class Pair < ApplicationRecord
 validates :all, presence: true
  belongs_to :currency

end
