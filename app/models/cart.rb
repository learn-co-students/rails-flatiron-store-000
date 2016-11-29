class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  def total
    priceTotal = 0
    items = LineItem.where(cart_id: self.id)
    items.each do |item|
      price = Item.find(item.item_id).price
      priceTotal += price
    end
    priceTotal
  end

  def add_item(item)
    cart = self
    item_to_add = Item.find(item)
    if LineItem.where(cart_id: cart.id, item_id: item_to_add.id).first == nil
      LineItem.create(cart_id: cart.id, item_id: item_to_add.id)
    else
      list_item = LineItem.where(cart_id: cart.id, item_id: item_to_add.id).first
      list_item.quantity += 1
      list_item.save
      list_item
    end
  end
end
