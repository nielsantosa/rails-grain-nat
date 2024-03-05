require "rails_helper"

RSpec.describe Item, type: :model do
  context 'create Item with all params' do
    it 'creates Item successfully' do
      item = Item.new(
        type: "Product",
        label: "Margharita Pizza",
        description: "active",
        price: 10.11
      )
      item.save

      expect(item.created_at).to be_present

      item.destroy
    end
  end

  context 'create Item with empty label' do
    it 'creates Item unsuccesfully' do
      item = Item.new(
        type: "Product",
        description: "active",
        price: 10.11
      )
      item.save

      expect(item.created_at).not_to be_present
    end
  end

  context 'create Item with empty type' do
    it 'creates Item unsuccesfully' do
      item = Item.new(
        label: "Margharita Pizza",
        description: "active",
        price: 10.11
      )
      item.save

      expect(item.created_at).not_to be_present
      item.destroy
    end
  end

  context 'create Item with invalid price type' do
    it 'creates Item unsuccesfully' do
      item = Item.new(
        type: "Product",
        label: "Margharita Pizza",
        description: "active",
        price: "xx"
      )
      item.save

      expect(item.created_at).not_to be_present
      item.destroy
    end
  end
end
