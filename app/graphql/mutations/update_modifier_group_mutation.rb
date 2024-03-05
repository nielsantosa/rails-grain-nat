module Mutations
  class UpdateModifierGroupMutation < GraphQL::Schema::Mutation
    # Update ModifierGroup
    field :updateModifierGroup, Types::ModifierGroupType, null: false
    payload_type Types::ModifierGroupType

    argument :id, ID, required: true
    argument :input, Types::ModifierGroupUpdateInputType, required: true

    def resolve(id:, input:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroupID : #{id} not found"
      end

      input_hash = input.to_h
      mg.update(input_hash)

      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end
  end
end
