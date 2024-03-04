# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # Menus
    field :getMenus, [Types::MenuType], null: false, description: "Return a list of Menu" do
      argument :page_num, Integer, required: false, description: "Number of object returned"
    end
    def getMenus(page_num: 10)
      Menu.limit(page_num).all
    end

    field :getMenuByID, Types::MenuType, null: false, description: "Return an Menu by ID" do
      argument :id, ID, required: true, description: "Object ID"
    end
    def getMenuByID(id:)
      Menu.find_by(id: id)
    end

    # MenuSections
    field :getMenuSections, [Types::MenuSectionType], null: false, description: "Return a list of MenuSections" do
      argument :page_num, Integer, required: false, description: "Number of items"
      argument :menu_id, Integer, required: false, description: "Menu ID"
      argument :section_id, Integer, required: false, description: "Section ID"
    end
    def getMenuSections(page_num: 10, menu_id: nil, section_id: nil)
      conditions = {}

      conditions[:menu_id] = menu_id if menu_id.present?
      conditions[:section_id] = section_id if section_id.present?

      MenuSection.where(conditions).limit(page_num)
    end

    # Sections
    field :getSections, [Types::SectionType], null: false, description: "Return a list of Sections" do
      argument :page_num, Integer, required: false, description: "Number of items"
    end
    def getSections(page_num: 10)
      Section.limit(page_num).all
    end

    field :getSectionByID, Types::SectionType, null: false, description: "Return a Section by ID" do
      argument :id, ID, required: true, description: "Object ID"
    end
    def getSectionByID(id:)
      Section.find_by(id: id)
    end

    # SectionItems
    field :getSectionItems, [Types::SectionItemType], null: false, description: "Return a list of SectionItems" do
      argument :page_num, Integer, required: false, description: "Number of items"
      argument :item_id, Integer, required: false, description: "Item ID"
      argument :section_id, Integer, required: false, description: "Section ID"
    end
    def getSectionItems(page_num: 10, item_id: nil, section_id: nil)
      conditions = {}

      conditions[:item_id] = item_id if item_id.present?
      conditions[:section_id] = section_id if section_id.present?

      SectionItem.where(conditions).limit(page_num)
    end

    # Items
    field :getItems, [Types::ItemType], null: false, description: "Return a list of Items" do
      argument :page_num, Integer, required: false, description: "Number of items"
    end
    def getItems(page_num: 10)
      Item.limit(page_num).all
    end

    field :getItemByID, Types::ItemType, null: false, description: "Return an Item by ID" do
      argument :id, ID, required: true, description: "Object ID"
    end
    def getItemByID(id:)
      Item.find_by(id: id)
    end

    # ItemModifierGroup
    field :getItemModifierGroups, [Types::ItemModifierGroupType], null: false, description: "Return a list of ItemModifierGroups" do
      argument :page_num, Integer, required: false, description: "Number of items"
      argument :item_id, Integer, required: false, description: "Item ID"
      argument :modifier_group_id, Integer, required: false, description: "ModifierGroup ID"
    end
    def getItemModifierGroups(page_num: 10, item_id: nil, modifier_group_id: nil)
      conditions = {}

      conditions[:item_id] = item_id if item_id.present?
      conditions[:modifier_group_id] = modifier_group_id if modifier_group_id.present?

      ItemModifierGroup.where(conditions).limit(page_num)
    end

    # ModifierGroups
    field :getModifierGroups, [Types::ModifierGroupType], null: false, description: "Return a list of ModifierGroup" do
      argument :page_num, Integer, required: false, description: "Number of items"
    end
    def getModifierGroups(page_num: 10)
      ModifierGroup.limit(page_num).all
    end

    field :getModifierGroupByID, Types::ModifierGroupType, null: false, description: "Return an ModifierGroup by ID" do
      argument :id, ID, required: true, description: "Object ID"
    end
    def getModifierGroupByID(id:)
      ModifierGroup.find_by(id: id)
    end

    # Modifiers
    field :getModifiers, [Types::ModifierType], null: false, description: "Return a list of Modifier" do
      argument :page_num, Integer, required: false, description: "Number of items"
      argument :ids, Integer, required: false, description: "Number of items"
    end
    def getModifiers(page_num: 10)
      Modifier.limit(page_num).all
    end

    field :getModifierByID, Types::ModifierType, null: false, description: "Return a Modifier by ID" do
      argument :id, ID, required: true, description: "Object ID"
    end
    def getModifierByID(id:)
      Modifier.find_by(id: id)
    end

  end
end
