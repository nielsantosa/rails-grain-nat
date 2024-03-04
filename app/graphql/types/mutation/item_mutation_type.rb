module Types
  class MutationType < Types::BaseObject
    # Item
    # Create Item
    field :createItem, Types::ItemType, null: false do
      description "Create an Item"
      argument :input, Types::ItemCreateInputType, required: true
    end
    def createItem(input:)
      input_hash = input.to_h
      item = Item.new(input_hash)
      if item.valid?
        item.save
        item
      else
        raise GraphQL::ExecutionError, "Invalid item input: #{item.errors.full_messages.join(', ')}"
      end
    end

    # Update Item
    field :updateItem, Types::ItemType, null: false do
      description "Update an Item"
      argument :id, ID, required: true
      argument :input, Types::ItemUpdateInputType, required: true
    end
    def updateItem(id:, input:)
      item = Item.find_by(id: id)
      if not item
        raise GraphQL::ExecutionError, "Item ID : #{id} not found"
      end

      input_hash = input.to_h
      item.update(input_hash)

      if item.valid?
        item.save
        item
      else
        raise GraphQL::ExecutionError, "Invalid item input: #{item.errors.full_messages.join(', ')}"
      end
    end

    # Delete Item
    field :deleteItem, Types::ItemType, null: false do
      description "Delete an Item"
      argument :id, ID, required: true
    end
    def deleteItem(id:)
      item = Item.find_by(id: id)
      if item.nil?
        raise GraphQL::ExecutionError, "Item ID : #{id} not found"
      end

      item.destroy
      item
    end

  end
end
