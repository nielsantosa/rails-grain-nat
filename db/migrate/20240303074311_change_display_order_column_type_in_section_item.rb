class ChangeDisplayOrderColumnTypeInSectionItem < ActiveRecord::Migration[7.1]
  def change
    change_column :menu_sections, :display_order, :integer, default: 0
  end
end
