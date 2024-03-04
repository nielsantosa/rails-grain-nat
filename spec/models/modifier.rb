require "rails_helper"

RSpec.describe Modifier, type: :model do
  context 'create Modifier with all params' do
    it 'creates Modifier successfully' do
      item = Item.create(
        label: "10 inch Pizza",
        price: 10.00,
        description: "A pizza with margaritha",
        type: "Component"
      )
      mg = ModifierGroup.create(
        label: "Size of Pizza",
        selection_required_min: 1,
        selection_required_max: 1,
      )

      m = Modifier.new(
        item: item,
        modifier_group: mg,
        display_order: 0,
        default_quantity: 1,
      )
      m.save

      expect(Modifier.count).to eq(1)
      expect(m.created_at).to be_present
      expect(m.item).to eq(item)
      expect(m.modifier_group).to eq(mg)
    end
  end

  context 'create Modifier with empty Item and Menu' do
    it 'creates Modifier unsuccesfully' do
      m= Modifier.new(
        display_order: 0,
        default_quantity: 1,
      )
      m.save

      expect(Modifier.count).to eq(0)
    end
  end
end
