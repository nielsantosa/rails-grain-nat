# frozen_string_literal: true

module Types
  class SectionItemUpdateInputType < Types::BaseInputObject
    argument :section_id, String
    argument :item_id, String
    argument :display_order, Integer
  end
end
