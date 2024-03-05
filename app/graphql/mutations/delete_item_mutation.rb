module Mutations
  class DeleteItemMutation < GraphQL::Schema::Mutation
    # Delete Item
    field :deleteItem, Types::ItemType, null: false
    payload_type Types::ItemType

    argument :id, ID, required: true

    def resolve(id:)
      item = Item.find_by(id: id)
      if item.nil?
        raise GraphQL::ExecutionError, "Item ID : #{id} not found"
      end

      item.destroy
      item
    end
  end
end
