class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :status
      t.string :image_url
      t.float :discount
      t.integer :type_id

      t.timestamps
    end
  end
end
