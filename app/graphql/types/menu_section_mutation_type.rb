module Types
  class MutationType < Types::BaseObject
    # MenuSection
    # Create MenuSection
    field :createMenuSection, Types::MenuSectionType, null: false do
      description "Create a MenuSection"
      argument :input, Types::MenuSectionCreateInputType, required: true
    end
    def createMenuSection(input:)
      input_hash = input.to_h
      ms = MenuSection.new(input_hash)
      if ms.valid?
        ms.save
        ms
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{ms.errors.full_messages.join(', ')}"
      end
    end

    # Delete MenuSection
    field :deleteMenuSection, Types::MenuSectionType, null: false do
      description "Delete a MenuSection by SectionID and MenuID"
      argument :section_id, ID, required: true
      argument :menu_id, ID, required: true
    end
    def deleteMenuSection(section_id:, menu_id:)
      ms = MenuSection.find_by(section_id: section_id, menu_id: menu_id)
      if ms.nil?
        raise GraphQL::ExecutionError, "MenuSection ID : section_id: #{section_id} and menu_id: #{menu_id} not found"
      end

      ms.destroy
      ms
    end
  end
end
