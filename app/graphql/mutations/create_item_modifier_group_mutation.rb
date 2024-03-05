module Mutations
  class CreateItemModifierGroupMutation < GraphQL::Schema::Mutation
    # Create ItemModifierGroup
    field :createItemModifierGroup, Types::ItemModifierGroupType, null: false
    payload_type Types::ItemModifierGroupType

    argument :input, Types::ItemModifierGroupCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      img = ItemModifierGroup.new(input_hash)
      if img.valid?
        img.save
        img
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{img.errors.full_messages.join(', ')}"
      end
    end
  end
end
