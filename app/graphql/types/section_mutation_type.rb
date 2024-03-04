module Types
  class MutationType < Types::BaseObject
    # Section
    # Create Section
    field :createSection, Types::SectionType, null: false do
      description "Create a Section"
      argument :input, Types::SectionCreateInputType, required: true
    end
    def createSection(input:)
      input_hash = input.to_h
      section = Section.new(input_hash)
      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end

    # Update Section
    field :updateSection, Types::SectionType, null: false do
      description "Update a Section"
      argument :id, ID, required: true
      argument :input, Types::SectionUpdateInputType, required: true
    end
    def updateSection(id:, input:)
      section  = Section.find_by(id: id)
      if not section
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      input_hash = input.to_h
      section.update(input_hash)

      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end

    # Delete Section
    field :deleteSection, Types::SectionType, null: false do
      description "Delete a Section"
      argument :id, ID, required: true
    end
    def deleteSection(id:)
      section = Section.find_by(id: id)
      if section.nil?
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      section.destroy
      section
    end
  end
end

