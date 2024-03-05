module Mutations
  class UpdateModifierMutation < GraphQL::Schema::Mutation
    # Update Modifier
    field :updateModifier, Types::ModifierType, null: false
    payload_type Types::ModifierType

    argument :id, ID, required: true
    argument :input, Types::ModifierUpdateInputType, required: true

    def updateModifier(id:, input:)
      modifier = Modifier.find_by(id: id)
      if modifier.nil?
        raise GraphQL::ExecutionError, "Modifier ID : #{id} not found"
      end

      input_hash = input.to_h
      if input_hash.key?(:item_id)
        item_id = input_hash.delete(:item_id)
        item = Item.find_by(id: item_id)
        modifier.update(item: item)
      end
      if input_hash.key?(:modifier_group_id)
        mg_id = input_hash.delete(:modifier_group_id)
        mg = ModifierGroup.find_by(id: mg_id)
        modifier.update(modifier_group: mg)
      end

      modifier.update(input_hash)

      if modifier.valid?
        modifier.save
        modifier
      else
        raise GraphQL::ExecutionError, "Invalid Modifier input: #{modifier.errors.full_messages.join(', ')}"
      end
    end
  end
end
