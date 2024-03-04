# frozen_string_literal: true

module Types
  class ItemModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, String
    field :modifier_group_id, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :item, Types::SectionType, null: true
    field :modifier_group, Types::ModifierGroupType, null: true
  end

  class ItemModifierGroupCreateInputType < Types::BaseInputObject
    argument :item_id, String, required: true
    argument :modifier_group_id, String, required: true
  end

  class ItemModifierGroupUpdateInputType < Types::BaseInputObject
    argument :item_id, String
    argument :modifier_group_id
  end
end
