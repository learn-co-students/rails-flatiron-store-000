class CartsController < ApplicationController

  def show
    @current_cart = Cart.find(session[:cart_id])
  end

  def checkout
    @checkout_cart = Cart.find(session[:cart_id])
    session[:cart_id] = nil
    line_items = LineItem.where(cart_id: @checkout_cart.id)
    line_items.each do |line_item|
      item = Item.find(line_item.id)
      item.inventory -= 1
      item.save
    end
  end


end
