class CreatePairCandles < ActiveRecord::Migration[5.1]
  def change
    create_table :pair_candles do |t|
      t.string :code
      t.integer :mts, :limit => 8
      t.decimal :open
      t.decimal :close
      t.decimal :high
      t.decimal :low
      t.decimal :volume
      t.integer :pair_id

      t.timestamps
    end
  end
end
