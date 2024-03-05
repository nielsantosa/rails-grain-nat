module Mutations
  class DeleteMenuMutation < GraphQL::Schema::Mutation
    # Delete Menu
    field :deleteMenu, Types::MenuType, null: false
    payload_type Types::MenuType

    argument :id, ID, required: true

    def resolve(id:)
      menu = Menu.find_by(id: id)
      if menu.nil?
        raise GraphQL::ExecutionError, "Menu ID : #{id} not found"
      end

      menu.destroy
      menu
    end
  end
end
