module Mutations
  class CreateSectionItemMutation < GraphQL::Schema::Mutation
    # SectionItem
    # Create SectionItem
    field :createSectionItem, Types::SectionItemType, null: false
    payload_type Types::SectionItemType

    argument :input, Types::SectionItemCreateInputType, required: true

    def resolve(input:)
      input_hash = input.to_h
      si = SectionItem.new(input_hash)
      if si.valid?
        si.save
        si
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{si.errors.full_messages.join(', ')}"
      end
    end
  end
end
