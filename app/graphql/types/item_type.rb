# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String
    field :label, String
    field :description, String
    field :price, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :section, Types::SectionType, null: true
    field :modifier_groups, [Types::ModifierGroupType], null: true
  end

  class ItemCreateInputType < Types::BaseInputObject
    argument :type, String, required: true
    argument :label, String, required: true
    argument :description, String
    argument :price, Float, required: true
    argument :section_id, ID, required: true
  end

  class ItemUpdateInputType < Types::BaseInputObject
    argument :type, String, required: false
    argument :label, String, required: false
    argument :description, String
    argument :price, Float, required: false
    argument :section_id, ID, required: false
  end
end
