module Mutations
  class CreateMenuMutation < GraphQL::Schema::Mutation
    # Create Menu
    field :createMenu, Types::MenuType, null: false
    payload_type Types::MenuType

    argument :input, Types::MenuCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      menu = Menu.new(input_hash)
      puts menu.id
      if menu.valid?
        menu.save
        menu
      else
        raise GraphQL::ExecutionError, "Invalid menu input: #{menu.errors.full_messages.join(', ')}"
      end
    end
  end
end
