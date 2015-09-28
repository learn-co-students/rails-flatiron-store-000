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
    # binding.pry
    line_items.each do |li|
      # binding.pry
      if item_id == li.item_id
        new_quantity = li.quantity + 1
        li.destroy
        # binding.pry
        return LineItem.create(cart_id: id, item_id: item_id, quantity: new_quantity)
      end
    end
    LineItem.create(cart_id: id, item_id: item_id)
  end
end
