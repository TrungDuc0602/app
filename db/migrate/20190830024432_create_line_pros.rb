class CreateLinePros < ActiveRecord::Migration[6.0]
  def change
    create_table :line_pros do |t|
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
