class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.text :content
      t.references :stock, null: false, foreign_key: true
      t.timestamps
    end
  end
end