# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    field :id, ID, null: false
    field :label, String
    field :state, String
    field :start_date, GraphQL::Types::ISO8601Date
    field :end_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :sections, [Types::SectionType], null: true
  end

  class MenuCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :state, String
    argument :start_date, GraphQL::Types::ISO8601Date
    argument :end_date, GraphQL::Types::ISO8601Date
  end

  class MenuUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :state, String
    argument :start_date, GraphQL::Types::ISO8601Date
    argument :end_date, GraphQL::Types::ISO8601Date
  end
end
