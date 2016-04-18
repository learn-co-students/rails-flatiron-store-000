class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items

  def total
    price = 0
    items.each do |item|
      price = price + item.price
    end
    price
  end

  def add_item(item_id)
    line_items.each do |li|
      if item_id.to_i == li.item_id
        new_quantity = li.quantity + 1
        li.destroy
        return line_items.build(cart_id: id, item_id: item_id.to_i, quantity: new_quantity)
      end
    end
    line_items.build(cart_id: id, item_id: item_id)
  end
end
