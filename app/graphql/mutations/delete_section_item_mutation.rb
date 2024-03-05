module Mutations
  class DeleteSectionItemMutation < GraphQL::Schema::Mutation
    # Delete SectionItem
    field :deleteSectionItem, Types::SectionItemType, null: false
    payload_type Types::SectionItemType

    argument :section_id, ID, required: true
    argument :item_id, ID, required: true

    def resolve(section_id:, item_id:)
      si = SectionItem.find_by(section_id: secton_id, item_id: item_id)
      if si.nil?
        raise GraphQL::ExecutionError, "SectionItem ID : section_id: #{section_id} and item_id: #{item_id} not found"
      end

      si.destroy
      si
    end
  end
end
