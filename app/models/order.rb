class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :items, through: :cart

  def create_from_cart
  end

  def change_order_status
    status = "submitted"
  end

  def change_inventory
    cart.itmes.inventory = cart.items.inventory - 1
  end

end
