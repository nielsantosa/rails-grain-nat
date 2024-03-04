require 'rails_helper'

RSpec.describe 'Menu mutation', type: :request do
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

  describe 'updateMenu' do
    # Create Menu
    menu = Menu.create!(
      label: "A Menu",
      state: "active",
      start_date: Date.today,
      end_date: Date.today + 1.days,
    )

    let(:query) do
      <<~GQL
        mutation ($id: ID!, $input: MenuUpdateInput!) {
          updateMenu(id: $id, input: $input) {
            id
            label
            state
            startDate
            endDate
          }
        }
      GQL
    end

    it 'updates a menu successfully' do
      # Prepare the input variables for the mutation
      variables = {
        id: menu.id,
        input: {
          label: 'New Menu Label',
          state: "active",
          startDate: (Date.today + 1).to_s,
          endDate: (Date.today + 2).to_s
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

      # Expect no errors in the response
      expect(errors).to be_nil

      # Expect the menu to be updated successfully
      expect(data['updateMenu']).to include(
        'id' => menu.id.to_s,
        'label' => 'New Menu Label',
        'state' => 'active',
        'startDate' => (Date.today + 1).to_s,
        'endDate' => (Date.today + 2).to_s
      )
    end
  end

  describe "deleteMenu" do
    # Create Menu
    menu = Menu.create!(
      label: "A Menu",
      state: "active",
      start_date: Date.today,
      end_date: Date.today + 1.days,
    )

    let(:query) do
      <<~GQL
        mutation($id: ID!) {
          deleteMenu(id: $id) {
            id
          }
        }
      GQL
    end

    it "deletes a menu" do
      # Prepare the variables for the mutation
      variables = {
        id: menu.id
      }

      # Execute the mutation
      post '/graphql', params: { query: query, variables: variables }

      # Expect a successful response
      expect(response).to have_http_status(:ok)

      # Parse the response body
      parsed_response = JSON.parse(response.body)

      # Expect the response to include the deleted menu ID
      expect(parsed_response["data"]["deleteMenu"]["id"]).to eq(menu.id.to_s)

      # Optionally, you can assert that the menu was actually deleted from the database
      expect(Menu.exists?(menu.id)).to be_falsey
    end
  end
end
