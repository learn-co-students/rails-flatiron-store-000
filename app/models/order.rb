class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :items, through: :cart

  def self.create_from_cart(cart)
    order = self.create
    order.cart = cart
    order.save
    order
  end

  def change_order_status
    self.status = "submitted"
    self
  end

  def change_inventory
    line_items = self.cart.line_items
    line_items.each do |line_item|
      item = Item.find(line_item.id)
      item.inventory -= 1
      item.save
    end
    self
  end

  
end
