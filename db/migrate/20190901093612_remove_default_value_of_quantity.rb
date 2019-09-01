class RemoveDefaultValueOfQuantity < ActiveRecord::Migration[6.0]
  def change
    change_column_default :line_items, :quantity, :from => 1, :to => nil
  end
end
