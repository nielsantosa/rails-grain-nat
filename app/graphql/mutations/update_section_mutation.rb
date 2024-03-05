module Mutations
  class UpdateSectionMutation < GraphQL::Schema::Mutation
    # Update Section
    field :updateSection, Types::SectionType, null: false
    payload_type Types::SectionType

    argument :id, ID, required: true
    argument :input, Types::SectionUpdateInputType, required: true

    def resolve(id:, input:)
      section  = Section.find_by(id: id)
      if not section
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      input_hash = input.to_h
      section.update(input_hash)

      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end
  end
end
