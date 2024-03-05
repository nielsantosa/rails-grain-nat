module Mutations
  class CreateModifierGroupMutation < GraphQL::Schema::Mutation
    # Create ModifierGroup
    field :createModifierGroup, Types::ModifierGroupType, null: false
    payload_type Types::ModifierGroupType

    argument :input, Types::ModifierGroupCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      mg = ModifierGroup.new(input_hash)
      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end
  end
end
