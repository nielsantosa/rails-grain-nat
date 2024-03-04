# frozen_string_literal: true

require_relative 'menu_mutation_type'
require_relative 'menu_section_mutation_type'
require_relative 'section_mutation_type'
require_relative 'section_item_mutation_type'
require_relative 'item_mutation_type'
require_relative 'img_mutation_type'
require_relative 'modifier_group_mutation_type'
require_relative 'modifier_mutation_type'

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

  end
end
