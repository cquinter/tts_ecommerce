class CartController < ApplicationController
	
  before_action :authenticate_user!, except: [:add_to_cart, :view_order]


  def checkout
    line_items = LineItem.all
    @order = Order.create(user_id: current_user.id, subtotal: 0)

    line_items.each do |line_item|
      line_item.product.update(quantity: (line_item.product.quantity - line_item.quantity))
      @order.order_items[line_item.product.id] = line_item.quantity # This is adding to the hash
      @order.subtotal += line_item.line_item_total
    end

    @order.save

    @order.update(sales_tax: (@order.subtotal * 0.08))
    @order.update(grand_total: (@order.subtotal + @order.sales_tax))

    line_items.destroy_all
  end


  def add_to_cart
  	line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity].to_i)
  	line_item.update(line_item_total: (line_item.quantity * line_item.product.price))
  	redirect_back(fallback_location: root_path)
  end


  def view_order
  	@line_items = LineItem.all
  end


end
