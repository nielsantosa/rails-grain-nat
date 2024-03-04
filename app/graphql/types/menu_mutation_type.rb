module Types
  class MutationType < Types::BaseObject
    # Create Menu
    field :createMenu, Types::MenuType, null: false do
      description "Create a Menu"
      argument :input, Types::MenuCreateInputType, required: true
    end
    def createMenu(input:)
      input_hash = input.to_h
      menu = Menu.new(input_hash)
      if menu.valid?
        menu.save
        menu
      else
        raise GraphQL::ExecutionError, "Invalid menu input: #{menu.errors.full_messages.join(', ')}"
      end
    end

    # Update Menu
    field :updateMenu, Types::MenuType, null: false do
      description "Update a Menu"
      argument :id, ID, required: true
      argument :input, Types::MenuUpdateInputType, required: true
    end
    def updateMenu(id:, input:)
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

    # Delete Menu
    field :deleteMenu, Types::MenuType, null: false do
      description "Delete a Menu"
      argument :id, ID, required: true
    end
    def deleteMenu(id:)
      menu = Menu.find_by(id: id)
      if menu.nil?
        raise GraphQL::ExecutionError, "Menu ID : #{id} not found"
      end

      menu.destroy
      menu
    end
  end
end
