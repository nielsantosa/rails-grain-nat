module Types
  class MutationType < Types::BaseObject
    # SectionItem
    # Create SectionItem
    field :createSectionItem, Types::SectionItemType, null: false do
      description "Create a SectionItem"
      argument :input, Types::SectionItemCreateInputType, required: true
    end
    def createSectionItem(input:)
      input_hash = input.to_h
      si = SectionItem.new(input_hash)
      if si.valid?
        si.save
        si
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{si.errors.full_messages.join(', ')}"
      end
    end

    # Delete SectionItem
    field :deleteSectionItem, Types::SectionItemType, null: false do
      description "Delete a Section by SectionID and MenuID"
      argument :section_id, ID, required: true
      argument :item_id, ID, required: true
    end
    def deleteSectionItem(section_id:, item_id:)
      si = SectionItem.find_by(section_id: secton_id, item_id: item_id)
      if si.nil?
        raise GraphQL::ExecutionError, "SectionItem ID : section_id: #{section_id} and item_id: #{item_id} not found"
      end

      si.destroy
      si
    end
  end
end
