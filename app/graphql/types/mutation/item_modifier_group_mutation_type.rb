module Types
  class MutationType < Types::BaseObject
    # ItemModifierGroup
    # Create ItemModifierGroup
    field :createItemModifierGroup, Types::ItemModifierGroupType, null: false do
      description "Create a ItemModifierGroup"
      argument :input, Types::ItemModifierGroupCreateInputType, required: true
    end
    def createItemModifierGroup(input:)
      input_hash = input.to_h
      img = ItemModifierGroup.new(input_hash)
      if img.valid?
        img.save
        img
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{img.errors.full_messages.join(', ')}"
      end
    end

    # Delete ItemModifierGroup
    field :deleteItemModifierGroup, Types::ItemModifierGroupType, null: false do
      description "Delete a ItemModifierGroup by ItemID and ModifierGroupID"
      argument :item_id, ID, required: true
      argument :modifier_group_id, ID, required: true
    end
    def deleteItemModifierGroup(item_id:, modifier_group_id:)
      img = ItemModifierGroup.find_by(item_id: item_id, modifier_group_id: modifier_group_id)
      if img.nil?
        raise GraphQL::ExecutionError, "ItemModifierGroup ID : item_id: #{item_id} and modifier_group_id: #{modifier_group_id} not found"
      end

      img.destroy
      img
    end
  end
end
