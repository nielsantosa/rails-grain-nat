module Types
  class MenuUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :state, String
    argument :start_date, GraphQL::Types::ISO8601Date
    argument :end_date, GraphQL::Types::ISO8601Date
  end
end
