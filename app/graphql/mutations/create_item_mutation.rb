module Mutations
  class CreateItemMutation < GraphQL::Schema::Mutation
    # Create Item
    field :createItem, Types::ItemType, null: false
    payload_type Types::ItemType

    argument :input, Types::ItemCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      item = Item.new(input_hash)
      if item.valid?
        item.save
        item
      else
        raise GraphQL::ExecutionError, "Invalid item input: #{item.errors.full_messages.join(', ')}"
      end
    end
  end
end
