module Mutations
  class CreateMenuSectionMutation < GraphQL::Schema::Mutation
    # Create MenuSection
    field :createMenuSection, Types::MenuSectionType, null: false
    payload_type Types::MenuSectionType

    argument :input, Types::MenuSectionCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      ms = MenuSection.new(input_hash)
      if ms.valid?
        ms.save
        ms
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{ms.errors.full_messages.join(', ')}"
      end
    end
  end
end
