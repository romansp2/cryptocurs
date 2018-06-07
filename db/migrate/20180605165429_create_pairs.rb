class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.string :code
      t.float :bid
      t.float :bid_size, :precision => 15, :scale => 10
      t.float :ask
      t.float :ask_size
      t.float :daily_change
      t.float :daily_change_perc
      t.float :last_price
      t.float :volume
      t.float :high
      t.float :low
      t.integer :currency_id

      t.timestamps
    end
  end
end
