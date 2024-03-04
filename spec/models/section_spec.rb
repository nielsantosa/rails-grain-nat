require "rails_helper"

RSpec.describe Section, type: :model do
  context 'create Section with all params' do
    it 'creates Section successfully' do
      section = Section.new(
        label: 'Pizza Menu',
        description: 'active',
      )

      expect { section.save }.to change(Section, :count).by(1)
      expect(section.created_at).to be_present
    end
  end

  context 'create Section with empty label' do
    it 'creates Section unsuccesfully' do
      section = Section.new(
      )

      expect { section.save }.to change(Section, :count).by(0)
    end
  end
end
