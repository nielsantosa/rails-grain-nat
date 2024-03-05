# frozen_string_literal: true

module Types
  class ItemUpdateInputType < Types::BaseInputObject
    argument :type, String, required: false
    argument :label, String, required: false
    argument :description, String
    argument :price, Float, required: false
  end
end
