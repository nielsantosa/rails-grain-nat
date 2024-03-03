# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :label, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :items, [Types::ItemType], null: true
    field :menu, Types::MenuType, null: true
  end

  class SectionCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :description, String
    argument :menu_id, ID, required: true
  end

  class SectionUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :menu_id, ID
  end
end
