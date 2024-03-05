# frozen_string_literal: true

module Types
  class MenuSectionUpdateInputType < Types::BaseInputObject
    argument :menu_id, String
    argument :section_id, String
    argument :display_order, Integer
  end
end
