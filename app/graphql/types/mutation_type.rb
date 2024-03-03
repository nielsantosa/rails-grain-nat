# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    # Menu
    # Create Menu
    field :createMenu, Types::MenuType, null: false do
      description "Create a Menu"
      argument :input, Types::MenuCreateInputType, required: true
    end
    def createMenu(input:)
      input_hash = input.to_h
      menu = Menu.new(input_hash)
      if menu.valid?
        menu.save
        menu
      else
        raise GraphQL::ExecutionError, "Invalid menu input: #{menu.errors.full_messages.join(', ')}"
      end
    end

    # Update Menu
    field :updateMenu, Types::MenuType, null: false do
      description "Update a Menu"
      argument :id, ID, required: true
      argument :input, Types::MenuUpdateInputType, required: true
    end
    def updateMenu(id:, input:)
      menu = Menu.find_by(id: id)
      if not menu
        raise GraphQL::ExecutionError, "Menu ID : #{id} not found"
      end

      input_hash = input.to_h
      menu.update(input_hash)

      if menu.valid?
        menu.save
        menu
      else
        raise GraphQL::ExecutionError, "Invalid menu input: #{menu.errors.full_messages.join(', ')}"
      end
    end

    # Delete Menu
    field :deleteMenu, Types::MenuType, null: false do
      description "Delete a Menu"
      argument :id, ID, required: true
    end
    def deleteMenu(id:)
      menu = Menu.find_by(id: id)
      if menu.nil?
        raise GraphQL::ExecutionError, "Menu ID : #{id} not found"
      end

      menu.destroy
      menu
    end

    # Section
    # Create Section
    field :createSection, Types::SectionType, null: false do
      description "Create a Section"
      argument :input, Types::SectionCreateInputType, required: true
    end
    def createSection(input:)
      input_hash = input.to_h
      menu_id = input_hash.delete(:menu_id)
      menu = Menu.find_by(id: menu_id)
      section = Section.new(input_hash.merge(menu: menu))
      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end

    # Update Section
    field :updateSection, Types::SectionType, null: false do
      description "Update a Section"
      argument :id, ID, required: true
      argument :input, Types::SectionUpdateInputType, required: true
    end
    def updateSection(id:, input:)
      section  = Section.find_by(id: id)
      if not section
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      input_hash = input.to_h
      if input_hash.key?(:menu_id)
        menu_id = input_hash.delete(:menu_id)
        menu = Menu.find_by(id: menu_id)
        section.update(input_hash.merge(menu: menu))
      else
        section.update(input_hash)
      end

      if section.valid?
        section.save
        section
      else
        raise GraphQL::ExecutionError, "Invalid section input: #{section.errors.full_messages.join(', ')}"
      end
    end

    # Delete Section
    field :deleteSection, Types::SectionType, null: false do
      description "Delete a Section"
      argument :id, ID, required: true
    end
    def deleteSection(id:)
      section = Section.find_by(id: id)
      if section.nil?
        raise GraphQL::ExecutionError, "Section ID : #{id} not found"
      end

      section.destroy
      section
    end

    # Item
    # Create Item
    field :createItem, Types::ItemType, null: false do
      description "Create an Item"
      argument :input, Types::ItemCreateInputType, required: true
    end
    def createItem(input:)
      input_hash = input.to_h
      section_id = input_hash.delete(:section_id)
      section = Section.find_by(id: section_id)
      item = Item.new(input_hash.merge(section: section))
      if item.valid?
        item.save
        item
      else
        raise GraphQL::ExecutionError, "Invalid item input: #{item.errors.full_messages.join(', ')}"
      end
    end

    # Update Item
    field :updateItem, Types::ItemType, null: false do
      description "Update an Item"
      argument :id, ID, required: true
      argument :input, Types::ItemUpdateInputType, required: true
    end
    def updateItem(id:, input:)
      item = Item.find_by(id: id)
      if not item
        raise GraphQL::ExecutionError, "Item ID : #{id} not found"
      end

      input_hash = input.to_h
      if input_hash.key?(:section_id)
        section_id = input_hash.delete(:section_id)
        section = Section.find_by(id: section_id)
        item.update(input_hash.merge(section: section))
      else
        item.update(input_hash)
        puts item
      end

      if item.valid?
        item.save
        item
      else
        raise GraphQL::ExecutionError, "Invalid item input: #{item.errors.full_messages.join(', ')}"
      end
    end

    # Delete Item
    field :deleteItem, Types::ItemType, null: false do
      description "Delete an Item"
      argument :id, ID, required: true
    end
    def deleteItem(id:)
      item = Item.find_by(id: id)
      if item.nil?
        raise GraphQL::ExecutionError, "Item ID : #{id} not found"
      end

      item.destroy
      item
    end

    # ModifierGroup
    # Create ModifierGroup
    field :createModifierGroup, Types::ModifierGroupType, null: false do
      description "Create a ModifierGroup"
      argument :input, Types::ModifierGroupCreateInputType, required: true
    end
    def createModifierGroup(input:)
      input_hash = input.to_h
      item_id = input_hash.delete(:item_id)
      item = Item.find_by(id: item_id)
      mg = ModifierGroup.new(input_hash.merge(item: item))
      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end

    # Update ModifierGroup
    field :updateModifierGroup, Types::ModifierGroupType, null: false do
      description "Update a ModifierGroup"
      argument :id, ID, required: true
      argument :input, Types::ModifierGroupUpdateInputType, required: true
    end
    def updateModifierGroup(id:, input:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroupID : #{id} not found"
      end

      input_hash = input.to_h
      if input_hash.key?(:item_id)
        item_id = input_hash.delete(:item_id)
        item = Item.find_by(id: item_id)
        mg.update(input_hash.merge(item: item))
      else
        mg.update(input_hash)
      end

      if mg.valid?
        mg.save
        mg
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{mg.errors.full_messages.join(', ')}"
      end
    end

    # Delete ModifierGroup
    field :deleteModifierGroup, Types::ModifierGroupType, null: false do
      description "Delete a ModifierGroup"
      argument :id, ID, required: true
    end
    def deleteModifierGroup(id:)
      mg = ModifierGroup.find_by(id: id)
      if mg.nil?
        raise GraphQL::ExecutionError, "ModifierGroup ID : #{id} not found"
      end

      mg.destroy
      mg
    end

    # Modifier
    # Create Modifier
    field :createModifier, Types::ModifierType, null: false do
      description "Create a Modifier"
      argument :input, Types::ModifierCreateInputType, required: true
    end
    def createModifier(input:)
      input_hash = input.to_h
      item_id = input_hash.delete(:item_id)
      mg_id = input_hash.delete(:modifier_group_id)
      item = Item.find_by(id: item_id)
      mg = ModifierGroup.find_by(id: mg_id)
      modifier = Modifier.new(input_hash.merge(item: item, modifier_group: mg))
      if modifier.valid?
        modifier.save
        modifier
      else
        raise GraphQL::ExecutionError, "Invalid Modifier input: #{modifier.errors.full_messages.join(', ')}"
      end
    end

    # Update Modifier
    field :updateModifier, Types::ModifierType, null: false do
      description "Update a Modifier"
      argument :id, ID, required: true
      argument :input, Types::ModifierUpdateInputType, required: true
    end
    def updateModifier(id:, input:)
      modifier = Modifier.find_by(id: id)
      if modifier.nil?
        raise GraphQL::ExecutionError, "Modifier ID : #{id} not found"
      end

      input_hash = input.to_h
      if input_hash.key?(:item_id)
        item_id = input_hash.delete(:item_id)
        item = Item.find_by(id: item_id)
        modifier.update(item: item)
      end
      if input_hash.key?(:modifier_group_id)
        mg_id = input_hash.delete(:modifier_group_id)
        mg = ModifierGroup.find_by(id: mg_id)
        modifier.update(modifier_group: mg)
      end

      modifier.update(input_hash)

      if modifier.valid?
        modifier.save
        modifier
      else
        raise GraphQL::ExecutionError, "Invalid ModifierGroup input: #{modifier.errors.full_messages.join(', ')}"
      end
    end

    # Delete Modifier
    field :deleteModifier, Types::ModifierType, null: false do
      description "Delete a Modifier"
      argument :id, ID, required: true
    end
    def deleteModifier(id:)
      m = Modifier.find_by(id: id)
      if m.nil?
        raise GraphQL::ExecutionError, "Modifier ID : #{id} not found"
      end

      m.destroy
      m
    end
  end
end
