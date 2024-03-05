module Mutations
  class DeleteItemModifierGroupMutation < GraphQL::Schema::Mutation
    # Delete ItemModifierGroup
    field :deleteItemModifierGroup, Types::ItemModifierGroupType, null: false
    payload_type Types::ItemModifierGroupType

    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    def resolve(item_id:, modifier_group_id:)
      img = ItemModifierGroup.find_by(item_id: item_id, modifier_group_id: modifier_group_id)
      if img.nil?
        raise GraphQL::ExecutionError, "ItemModifierGroup ID : item_id: #{item_id} and modifier_group_id: #{modifier_group_id} not found"
      end

      img.destroy
      img
    end
  end
end
