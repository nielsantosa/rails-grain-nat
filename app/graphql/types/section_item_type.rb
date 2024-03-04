# frozen_string_literal: true

module Types
  class SectionItemType < Types::BaseObject
    field :id, ID, null: false
    field :section_id, String
    field :item_id, String
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :section, Types::SectionType, null: true
    field :item, Types::ItemType, null: true
  end

  class SectionItemCreateInputType < Types::BaseInputObject
    argument :section_id, String, required: true
    argument :item_id, String, required: true
    argument :display_order, Integer
  end

  class SectionItemUpdateInputType < Types::BaseInputObject
    argument :section_id, String
    argument :item_id, String
    argument :display_order, Integer
  end
end
