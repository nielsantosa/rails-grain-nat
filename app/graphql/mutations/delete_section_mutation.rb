module Mutations
  class DeleteSectionMutation < GraphQL::Schema::Mutation
    # Delete Section
    field :deleteSection, Types::SectionType, null: false
    payload_type Types::SectionType

    argument :id, ID, required: true

    def resolve(id:)
      section = Section.find_by(id: id)
      if section.nil?
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      section.destroy
      section
    end
  end
end
