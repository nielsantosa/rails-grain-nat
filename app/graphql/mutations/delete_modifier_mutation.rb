module Mutations
  class DeleteModifierMutation < GraphQL::Schema::Mutation
    # Delete Modifier
    field :deleteModifier, Types::ModifierType, null: false
    payload_type Types::ModifierType

    argument :modifier_group_id, ID, required: true
    argument :item_id, ID, required: true

    def deleteModifier(item_id:, modifier_group_id:)
      m = Modifier.find_by(item_id: item_id, modifier_group_id: modifier_group_id)
      if m.nil?
        raise GraphQL::ExecutionError, "Modifier ID : ModifierGroupID #{modifier_group_id} and ItemID #{item_id} not found"
      end

      m.destroy
      m
    end
  end
end
