class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    order = Order.create_from_cart(@cart)
    order.change_inventory
    order.change_order_status
    session[:cart_id] = nil
    redirect_to store_path
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end
