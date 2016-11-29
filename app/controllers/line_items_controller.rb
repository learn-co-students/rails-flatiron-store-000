class LineItemsController < ApplicationController

  def create 
    if Cart.count != 0
      session[:cart_id] = Cart.last.id
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @item = Item.find(params[:item_id])
    @lineItem = LineItem.where(item_id: @item.id, cart_id: session[:cart_id]).first
    if @lineItem != nil
      @lineItem.quantity += 1
      @lineItem.save
    else
      new_line_item = LineItem.create
      new_line_item.cart = Cart.find(session[:cart_id])
      new_line_item.item = @item
      new_line_item.save
    end
    redirect_to "/"
  end

  def index
    binding.pry
  end

end
