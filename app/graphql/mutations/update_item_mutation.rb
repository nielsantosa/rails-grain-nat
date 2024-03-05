module Mutations
  class UpdateItemMutation < GraphQL::Schema::Mutation
    # Update Item
    field :updateItem, Types::ItemType, null: false
    payload_type Types::ItemType

    argument :id, ID, required: true
    argument :input, Types::ItemUpdateInputType, required: true

    def resolve(id:, input:)
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
  end
end
