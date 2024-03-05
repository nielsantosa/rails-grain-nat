# frozen_string_literal: true

module Types
  class ItemCreateInputType < Types::BaseInputObject
    argument :type, String, required: true
    argument :label, String, required: true
    argument :description, String
    argument :price, Float, required: true
  end
end
