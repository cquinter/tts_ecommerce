class AddCategoryNameToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :category_name, :string
  end
end
