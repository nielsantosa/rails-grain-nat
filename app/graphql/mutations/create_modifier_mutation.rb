module Mutations
  class CreateModifierMutation < GraphQL::Schema::Mutation
    # Create Modifier
    field :createModifier, Types::ModifierType, null: false
    payload_type Types::ModifierType

    argument :input, Types::ModifierCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      item_id = input_hash.delete(:item_id)
      mg_id = input_hash.delete(:modifier_group_id)
      item = Item.find_by(id: item_id)
      mg = ModifierGroup.find_by(id: mg_id)
      modifier = Modifier.new(input_hash.merge(item: item, modifier_group: mg))
      if modifier.valid?
        modifier.save
        modifier
      else
        raise GraphQL::ExecutionError, "Invalid Modifier input: #{modifier.errors.full_messages.join(', ')}"
      end
    end
  end
end
