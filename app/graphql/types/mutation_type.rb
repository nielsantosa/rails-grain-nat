# frozen_string_literal: true

require_relative 'mutation/menu_mutation_type'
require_relative 'mutation/menu_section_mutation_type'
require_relative 'mutation/section_mutation_type'
require_relative 'mutation/section_item_mutation_type'
require_relative 'mutation/item_mutation_type'
require_relative 'mutation/item_modifier_group_mutation_type'
require_relative 'mutation/modifier_group_mutation_type'
require_relative 'mutation/modifier_mutation_type'

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
