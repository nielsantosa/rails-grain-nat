# frozen_string_literal: true

module Types
  class SectionCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :description, String
  end
end
