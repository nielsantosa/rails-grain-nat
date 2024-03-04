module Types
  class MutationType < Types::BaseObject
    # ModifierGroup
    # Create ModifierGroup
    field :createModifierGroup, Types::ModifierGroupType, null: false do
      description "Create a ModifierGroup"
      argument :input, Types::ModifierGroupCreateInputType, required: true
    end
    def createModifierGroup(input:)
      input_hash = input.to_h
      mg = ModifierGroup.new(input_hash)
      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end

    # Update ModifierGroup
    field :updateModifierGroup, Types::ModifierGroupType, null: false do
      description "Update a ModifierGroup"
      argument :id, ID, required: true
      argument :input, Types::ModifierGroupUpdateInputType, required: true
    end
    def updateModifierGroup(id:, input:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroupID : #{id} not found"
      end

      input_hash = input.to_h
      mg.update(input_hash)

      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end

    # Delete ModifierGroup
    field :deleteModifierGroup, Types::ModifierGroupType, null: false do
      description "Delete a ModifierGroup"
      argument :id, ID, required: true
    end
    def deleteModifierGroup(id:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroup ID : #{id} not found"
      end

      mg.destroy
      mg
    end
  end
end
