# frozen_string_literal: true

module Types
  class ModifierGroupUpdateInputType < Types::BaseInputObject
    argument :label, String
    argument :selection_required_min, Integer
    argument :selection_required_max, Integer
  end
end
