# frozen_string_literal: true

module Types
  class ModifierGroupCreateInputType < Types::BaseInputObject
    argument :label, String, required: true
    argument :selection_required_min, Integer
    argument :selection_required_max, Integer
  end
end
