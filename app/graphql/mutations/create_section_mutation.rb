module Mutations
  class CreateSectionMutation < GraphQL::Schema::Mutation
    # Create Section
    field :createSection, Types::SectionType, null: false
    payload_type Types::SectionType

    argument :input, Types::SectionCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      section = Section.new(input_hash)
      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end
  end
end
