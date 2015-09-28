require 'rails_helper'

RSpec.describe Item, :type => :model do
  before do
    @item = Item.first
  end

  it 'belongs to a category' do 
    expect(@item.category).to eq(Category.first)
  end

  context 'with line_items' do 
    before do 
      @cart = Cart.first
      @line_item1 = @cart.add_item(@item.id)
      @line_item1.save
      # binding.pry
      @line_item2 = @cart.add_item(@item.id)
      @line_item2.save
      # binding.pry
    end

    it 'has many line_items consolidated by line_item quantity' do 
      # binding.pry
      expect(@item.line_items.first.quantity).to eq(2)
    end
  end
end
