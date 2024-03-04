module Types
  class MutationType < Types::BaseObject
    # Modifier
    # Create Modifier
    field :createModifier, Types::ModifierType, null: false do
      description "Create a Modifier"
      argument :input, Types::ModifierCreateInputType, required: true
    end
    def createModifier(input:)
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

    # Update Modifier
    field :updateModifier, Types::ModifierType, null: false do
      description "Update a Modifier"
      argument :id, ID, required: true
      argument :input, Types::ModifierUpdateInputType, required: true
    end
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
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{modifier.errors.full_messages.join(', ')}"
      end
    end

    # Delete Modifier
    field :deleteModifier, Types::ModifierType, null: false do
      description "Delete a Modifier By ModifierGroupId and ItemId"
      argument :modifier_group_id, ID, required: true
      argument :item_id, ID, required: true
    end
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
