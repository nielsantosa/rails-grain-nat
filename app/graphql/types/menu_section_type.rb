# frozen_string_literal: true

module Types
  class MenuSectionType < Types::BaseObject
    field :id, ID, null: false
    field :menu_id, String
    field :section_id, String
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :section, Types::SectionType, null: true
    field :menu, Types::MenuType, null: true
  end

  class MenuSectionCreateInputType < Types::BaseInputObject
    argument :menu_id, String, required: true
    argument :section_id, String, required: true
    argument :display_order, Integer
  end

  class MenuSectionUpdateInputType < Types::BaseInputObject
    argument :menu_id, String
    argument :section_id, String
    argument :display_order, Integer
  end
end
