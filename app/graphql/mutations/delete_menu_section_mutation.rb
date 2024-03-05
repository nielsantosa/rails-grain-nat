module Mutations
  class DeleteMenuSectionMutation < GraphQL::Schema::Mutation
    # Delete MenuSection
    field :deleteMenuSection, Types::MenuSectionType, null: false
    payload_type Types::MenuSectionType
    
    argument :section_id, ID, required: true
    argument :menu_id, ID, required: true

    def resolve(section_id:, menu_id:)
      ms = MenuSection.find_by(section_id: section_id, menu_id: menu_id)
      if ms.nil?
        raise GraphQL::ExecutionError, "MenuSection ID : section_id: #{section_id} and menu_id: #{menu_id} not found"
      end

      ms.destroy
      ms
    end
  end
end
