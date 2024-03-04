require "rails_helper"

RSpec.describe MenuSection, type: :model do
  context 'create MenuSection with all params' do
    it 'creates MenuSection successfully' do
      menu = Menu.create(
        label: 'Pizza Menu',
        state: 'active',
        start_date: Date.today,
        end_date: Date.today + 1,
      )
      section = Section.create(
        label: 'Classic Pizza',
        description: 'active',
      )

      ms = MenuSection.new(menu: menu, section:section, display_order: 1)

      expect { ms.save }.to change(MenuSection, :count).by(1)
      expect(ms.created_at).to be_present
    end
  end

  context 'create MenuSection with empty display_order' do
    it 'creates MenuSection succesfully with default 0' do
      menu = Menu.create(
        label: 'Pizza Menu',
        state: 'active',
        start_date: Date.today,
        end_date: Date.today + 1,
      )
      section = Section.create(
        label: 'Classic Pizza',
        description: 'active',
      )

      ms = MenuSection.new(menu: menu, section:section)
      ms.save

      expect(MenuSection.count).to eq(1)
      expect(ms.created_at).to be_present
      expect(ms.display_order).to eq(0)
    end
  end
end
