class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.integer :status, default: 0
      t.string :market
      t.string :industry
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end