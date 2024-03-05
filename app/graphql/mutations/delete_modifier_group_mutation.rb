module Mutations
  class DeleteModifierGroupMutation < GraphQL::Schema::Mutation
    # Delete ModifierGroup
    field :deleteModifierGroup, Types::ModifierGroupType, null: false
    payload_type Types::ModifierGroupType

    argument :id, ID, required: true

    def resolve(id:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroup ID : #{id} not found"
      end

      mg.destroy
      mg
    end
  end
end
