class ChangeDefaultQuantityColumnTypeInModifiers < ActiveRecord::Migration[7.1]
  def change
    change_column :modifiers, :default_quantity, :integer, default: 0
  end
end
