class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.integer :combo_id
      t.integer :product_id

      t.timestamps
    end
  end
end
