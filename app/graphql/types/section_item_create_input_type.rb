# frozen_string_literal: true

module Types
  class SectionItemCreateInputType < Types::BaseInputObject
    argument :section_id, String, required: true
    argument :item_id, String, required: true
    argument :display_order, Integer
  end
end
