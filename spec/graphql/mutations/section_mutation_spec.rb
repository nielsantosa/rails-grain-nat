require 'rails_helper'

RSpec.describe "Section Mutation", type: :request do
  describe 'createSection' do
    let(:query) do
      <<~GQL
        mutation($input: SectionCreateInput!) {
          createSection(input: $input) {
            id
            label
            description
          }
        }
      GQL
    end

    it 'creates a new section' do
      # Prepare the input variables
      input = {
        label: 'Test Section',
        description: 'This is a test section'
      }

      # Execute the mutation
      post '/graphql', params: { query: query, variables: { input: input } }

      # Parse the response
      result = JSON.parse(response.body)

      # Verify the response
      section = result['data']['createSection']
      expect(section['id']).not_to be_nil
      expect(section['label']).to eq('Test Section')
      expect(section['description']).to eq('This is a test section')

      # Verify the section is persisted in the database
      created_section = Section.find(section['id'])
      expect(created_section).not_to be_nil
      expect(created_section.label).to eq('Test Section')
      expect(created_section.description).to eq('This is a test section')
    end

    it 'returns an error for invalid input' do
      # Prepare the input variables with missing required fields
      input = {
        description: 'This is a test section'
      }

      # Execute the mutation
      post '/graphql', params: { query: query, variables: { input: input } }

      # Parse the response
      result = JSON.parse(response.body)

      # Verify the response
      expect(result['data']).to be_nil
      error_message = result['errors'].first['message']
      expect(error_message).not_to be_nil
    end
  end
end
