class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :value
      t.integer :stock_amount

      t.timestamps
    end
  end
end
