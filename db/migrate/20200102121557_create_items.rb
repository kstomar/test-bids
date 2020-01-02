class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :auction, foreign_key: true
      t.decimal :minimum_bid_value
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
