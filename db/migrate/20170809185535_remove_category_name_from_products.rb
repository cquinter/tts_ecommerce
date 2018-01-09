class RemoveCategoryNameFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :category_name, :string
  end
end
