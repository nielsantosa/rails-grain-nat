require 'rails_helper'

RSpec.describe 'createMenu mutation', type: :request do
  describe 'createMenu' do
    let(:query) do
      <<~GQL
        mutation ($input: MenuCreateInput!) {
          createMenu(input: $input) {
            id
            label
            state
            startDate
            endDate
          }
        }
      GQL
    end

    it 'creates a menu successfully' do
      # Prepare the input variables for the mutation
      variables = {
        input: {
          label: 'Pizza Menu',
          state: 'active',
          startDate: Date.today.to_s,
          endDate: (Date.today + 1).to_s
        }
      }

      # Execute the mutation
      post '/graphql', params: { query: query, variables: variables }

      # Expect a successful response
      expect(response).to have_http_status(:ok)

      # Parse the JSON response
      json_response = JSON.parse(response.body)
      data = json_response["data"]
      errors = json_response["errors"]

      # Expect no errors in the response
      expect(errors).to be_nil

      # Expect the menu to be created successfully
      expect(data["createMenu"]).to include(
        'id' => be_present,
        'label' => 'Pizza Menu',
        'state' => 'active',
        'startDate' => Date.today.to_s,
        'endDate' => (Date.today + 1).to_s
      )
    end

    it 'returns an error when invalid input is provided' do
      # Prepare invalid input variables for the mutation
      variables = {
        input: {
          label: nil, # Invalid: empty label
          state: 'active',
          startDate: Date.today.to_s,
          endDate: (Date.today + 1).to_s
        }
      }

      # Execute the mutation
      post '/graphql', params: { query: query, variables: variables }

      # Expect a successful response
      expect(response).to have_http_status(:ok)

      # Parse the JSON response
      json_response = JSON.parse(response.body)
      data = json_response['data']
      errors = json_response['errors']

      # Expect the mutation to return an error
      expect(errors).to be_present
      expect(data).to be_nil
    end
  end
end
