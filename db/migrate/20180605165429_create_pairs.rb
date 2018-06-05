class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.decimal :bid
      t.decimal :bid_size
      t.decimal :ask
      t.decimal :ask_size
      t.decimal :daily_change
      t.decimal :daily_change_perc
      t.decimal :last_price
      t.decimal :volume
      t.decimal :high
      t.decimal :low
      t.integer :currency_id

      t.timestamps
    end
  end
end
