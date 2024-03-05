require "rails_helper"

RSpec.describe ModifierGroup, type: :model do
  context 'create ModifierGroup with all params' do
    it 'creates ModifierGroup successfully' do
      mg = ModifierGroup.new(
        label: "Size of Pizza",
        selection_required_min: 0,
        selection_required_max: 2,
      )
      mg.save

      expect(mg.created_at).to be_present
      mg.destroy
    end
  end

  context 'create ModifierGroup with empty label' do
    it 'creates ModifierGroup unsuccesfully' do
      mg= ModifierGroup.new(
        selection_required_min: 0,
        selection_required_max: 2,
      )
      mg.save

      expect(mg.created_at).not_to be_present
      mg.destroy
    end
  end

  context 'create ModifierGroup with selection_required_max less then selection_required_min' do
    it 'creates ModifierGroup unsuccesfully' do
      mg= ModifierGroup.new(
        label: "Size of Pizza",
        selection_required_min: 4,
        selection_required_max: 1,
      )
      mg.save

      expect(mg.created_at).not_to be_present
      mg.destroy
    end
  end
end
