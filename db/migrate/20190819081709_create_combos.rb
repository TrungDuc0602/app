class CreateCombos < ActiveRecord::Migration[6.0]
  def change
    create_table :combos do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :image_url

      t.timestamps
    end
  end
end
