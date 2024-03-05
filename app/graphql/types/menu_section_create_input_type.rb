# frozen_string_literal: true

module Types
  class MenuSectionCreateInputType < Types::BaseInputObject
    argument :menu_id, String, required: true
    argument :section_id, String, required: true
    argument :display_order, Integer
  end
end
