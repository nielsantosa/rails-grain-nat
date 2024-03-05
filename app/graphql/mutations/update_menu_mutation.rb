module Mutations
  class UpdateMenuMutation < GraphQL::Schema::Mutation
    # Update Menu
    field :updateMenu, Types::MenuType, null: false
    payload_type Types::MenuType

    argument :id, ID, required: true
    argument :input, Types::MenuUpdateInputType, required: true

    def resolve(id:, input:)
      menu = Menu.find_by(id: id)
      if not menu
        raise GraphQL::ExecutionError, "Menu ID : #{id} not found"
      end

      input_hash = input.to_h
      menu.update(input_hash)

      if menu.valid?
        menu.save
        menu
      else
        raise GraphQL::ExecutionError, "Invalid menu input: #{menu.errors.full_messages.join(', ')}"
      end
    end
  end
end
