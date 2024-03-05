# frozen_string_literal: true

#require_relative 'modifier_group_mutation_type'
#require_relative 'modifier_mutation_type'

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    # Menu
    field :createMenu, mutation:  Mutations::CreateMenuMutation
    field :updateMenu, mutation:  Mutations::UpdateMenuMutation
    field :deleteMenu, mutation:  Mutations::DeleteMenuMutation

    # MenuSection
    field :createMenuSection, mutation:  Mutations::CreateMenuSectionMutation
    field :deleteMenuSection, mutation:  Mutations::DeleteMenuSectionMutation

    # Section
    field :createSection, mutation:  Mutations::CreateSectionMutation
    field :updateSection, mutation:  Mutations::UpdateSectionMutation
    field :deleteSection, mutation:  Mutations::DeleteSectionMutation

    # SectionItem
    field :createSectionItem, mutation:  Mutations::CreateSectionItemMutation
    field :deleteSectionItem, mutation:  Mutations::DeleteSectionItemMutation

    # Item
    field :createItem, mutation:  Mutations::CreateItemMutation
    field :updateItem, mutation:  Mutations::UpdateItemMutation
    field :deleteItem, mutation:  Mutations::DeleteItemMutation

    # ItemModifierGroup
    field :createItemModifierGroup, mutation:  Mutations::CreateItemModifierGroupMutation
    field :deleteItemModifierGroup, mutation:  Mutations::DeleteItemModifierGroupMutation

    # ModifierGroup 
    field :createModifierGroup, mutation:  Mutations::CreateModifierGroupMutation
    field :updateModifierGroup, mutation:  Mutations::UpdateModifierGroupMutation
    field :deleteModifierGroup, mutation:  Mutations::DeleteModifierGroupMutation

    # ModifierGroup 
    field :createModifier, mutation:  Mutations::CreateModifierMutation
    field :updateModifier, mutation:  Mutations::UpdateModifierMutation
    field :deleteModifier, mutation:  Mutations::DeleteModifierMutation

  end
end
