module Types
  class MenuCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :state, String
    argument :start_date, GraphQL::Types::ISO8601Date
    argument :end_date, GraphQL::Types::ISO8601Date
  end
end
