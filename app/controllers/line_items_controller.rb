class LineItemsController < ApplicationController

  def create
    if session[:cart_id] == nil
      @cart = Cart.create
      li = @cart.add_item(params[:item_id])
      li.save
      session[:cart_id] = @cart.id
      redirect_to @cart
    else
      @cart = Cart.find(session[:cart_id])
      li = @cart.add_item(params[:item_id])
      li.save
      redirect_to @cart
    end
  end

end
