require "rails_helper"

RSpec.describe Menu, type: :model do
  context 'create menu with all params' do
    it 'creates menu successfully' do
      menu = Menu.new(
        label: 'Pizza Menu',
        state: 'active',
        start_date: Date.today,
        end_date: Date.today + 1.day
      )

      expect { menu.save }.to change(Menu, :count).by(1)
      expect(menu.created_at).to be_present
    end
  end

  context 'create menu with wrong state' do
    it 'creates menu unsuccesfully' do
      menu = Menu.new(
        label: 'Pizza Menu',
        state: 'unofficial state',
        start_date: Date.today,
        end_date: Date.today + 1.day
      )

      expect { menu.save }.to change(Menu, :count).by(0)
    end
  end

  context 'create menu with empty label' do
    it 'creates menu unsuccesfully' do
      menu = Menu.new(
        state: 'unofficial state',
        start_date: Date.today,
        end_date: Date.today + 1.day
      )

      expect { menu.save }.to change(Menu, :count).by(0)
    end
  end

  context 'create menu with start date less than end date' do
    it 'creates menu unsuccesfully' do
      menu = Menu.new(
        label: 'Pizza Menu',
        state: 'active',
        start_date: Date.today,
        end_date: Date.today - 1.day
      )

      expect { menu.save }.to change(Menu, :count).by(0)
    end
  end

  context 'create menu with wrong start date and end date type' do
    it 'creates menu unsuccesfully' do
      menu = Menu.new(
        label: 'Pizza Menu',
        state: 'active',
        start_date: 22,
        end_date: 23
      )

      expect { menu.save }.to change(Menu, :count).by(0)
    end
  end
end
