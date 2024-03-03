# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :label, String
    field :selection_required_min, Integer
    field :selection_required_max, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::ItemType, null: true
    field :modifiers, [Types::ModifierType], null: true
  end

  class ModifierGroupCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :selection_required_min, Integer
    argument :selection_required_max, Integer
    argument :item_id, ID, required: true
  end

  class ModifierGroupUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :selection_required_min, Integer
    argument :selection_required_max, Integer
    argument :item_id, ID
  end
end
