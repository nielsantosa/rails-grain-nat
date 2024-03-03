class ChangeDisplayOrderColumnTypeInModifiers < ActiveRecord::Migration[7.1]
  def change
    change_column :modifiers, :display_order, :integer, default: 0
  end
end
