require 'rails_helper'

RSpec.describe 'Mutations', type: :request do
  describe 'createModifier' do
    let!(:item) { create(:item) }
    let!(:modifier_group) { create(:modifier_group) }
    let(:query) do
      <<~GRAPHQL
        mutation($input: ModifierCreateInputType!) {
          createModifier(input: $input) {
            id
            name
            # Include other fields you want to test
            # ...
          }
        }
      GRAPHQL
    end

    it 'creates a new modifier' do
      input = {
        item_id: item.id,
        modifier_group_id: modifier_group.id,
        name: 'Test Modifier',
        # Include other input fields as required
        # ...
      }

      post '/graphql', params: { query: query, variables: { input: input } }

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      data = json_response['data']['createModifier']

      expect(data['name']).to eq('Test Modifier')
      # Test other fields as required
      # ...
    end
  end

  # Add tests for other CRUD operations (update, delete, etc.) similarly
end
