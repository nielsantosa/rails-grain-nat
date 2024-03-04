require 'rails_helper'

RSpec.describe "ItemModifier Mutation", type: :request do
  describe 'createItemModifierGroup' do
    item = Item.create!(label: "Pizza", type: "Product", price: 10.00)
    mg = ModifierGroup.create!(label: "Size of Pizza", selection_required_min: 1, selection_required_max: 1)

    let(:item_id) { item.id }
    let(:modifier_group_id) { mg.id }
    let(:input) { { itemId: item_id, modifierGroupId: modifier_group_id } }

    let(:query) do
      <<~GQL
        mutation ($input: ItemModifierGroupCreateInput!) {
          createItemModifierGroup(input: $input) {
            id
            itemId
            modifierGroupId
            createdAt
            updatedAt
          }
        }
      GQL
    end

    it 'creates a new ItemModifierGroup' do
      variables = {
        input: {
          itemId: item_id,
          modifierGroupId: modifier_group_id,
        }
      }
      expect do
        post '/graphql', params: { query: query, variables: variables }
      end.to change(ItemModifierGroup, :count).by(1)
    end

    it 'returns the created ItemModifierGroup' do
      post '/graphql', params: { query: query, variables: { input: input } }
      result = JSON.parse(response.body)
      item_modifier_group = result['data']['createItemModifierGroup']

      expect(item_modifier_group).to include(
        'id' => be_present,
        'itemId' => item_id.to_s,
        'modifierGroupId' => modifier_group_id.to_s,
        'createdAt' => be_present,
        'updatedAt' => be_present
      )
    end

    context 'when the input is invalid' do
      before do
        # Add any necessary setup for invalid input
        input.delete(:itemId)
      end

      it 'raises an error' do
        post '/graphql', params: { query: query, variables: { input: input } }
        result = JSON.parse(response.body)
        errors = result['errors']

        expect(errors).to be_present
        expect(errors[0]['message']).not_to be_nil
      end

      it 'does not create a new ItemModifierGroup' do
        expect do
          post '/graphql', params: { query: query, variables: { input: input } }
        end.not_to change(ItemModifierGroup, :count)
      end
    end
  end
end
