class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
