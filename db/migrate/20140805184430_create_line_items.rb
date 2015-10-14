class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, :default  => 1
      t.references :cart
      t.references :item
    end
  end
end
