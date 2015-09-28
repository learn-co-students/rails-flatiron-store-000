class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :items, through: :cart

  def self.create_from_cart(cart)
    Order.create(cart_id: cart.id)
  end

  def change_order_status
    update(status: "submitted")
  end

  def change_inventory
    items.each do |item|
      cart.line_items.each do |li|
        if li.item_id == item.id
          item.inventory = item.inventory - li.quantity
          item.save
        end
      end
    end
  end

end
