class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :quantity
      t.string :brand
      t.integer :category_id

      t.timestamps
    end
  end
end
