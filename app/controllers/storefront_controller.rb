class StorefrontController < ApplicationController

  def all_items
  	@products = Product.all.order('name ASC')
  end

  def items_by_category
  	@category = Category.find(params[:category_id].to_i)
  	@products = @category.products
  end

  def items_by_brand
  	@brand = params[:brand]
  	@products = Product.where(brand: @brand).order('name ASC')
  end

end
