# frozen_string_literal: true

module Types
  class SectionUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :description, String
  end
end
