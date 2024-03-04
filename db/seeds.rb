# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Clear existing data
SectionItem.destroy_all
MenuSection.destroy_all
Section.destroy_all
Menu.destroy_all
ItemModifierGroup.destroy_all
Modifier.destroy_all
Item.destroy_all
ModifierGroup.destroy_all

# Reset auto-increment counters for the tables
ActiveRecord::Base.connection.reset_pk_sequence!('section_items')
ActiveRecord::Base.connection.reset_pk_sequence!('menu_sections')
ActiveRecord::Base.connection.reset_pk_sequence!('sections')
ActiveRecord::Base.connection.reset_pk_sequence!('menus')
ActiveRecord::Base.connection.reset_pk_sequence!('item_modifier_groups')
ActiveRecord::Base.connection.reset_pk_sequence!('modifiers')
ActiveRecord::Base.connection.reset_pk_sequence!('items')
ActiveRecord::Base.connection.reset_pk_sequence!('modifier_groups')

# Create Menus
menu1 = Menu.create!(label: "Pizza Menu", state: "active", start_date: Date.today, end_date: nil)
menu2 = Menu.create!(label: "Burger Menu", state: "active", start_date: Date.today, end_date: nil)

# Create Sections
section1 = Section.create!(label: "Classic Pizzas", description: "Delicious classic pizzas")
section2 = Section.create!(label: "Specialty Pizzas", description: "Unique and flavorful pizzas")
section3 = Section.create!(label: "Beef Burgers", description: "Mouth-watering beef burgers")
section4 = Section.create!(label: "Chicken Burgers", description: "Tasty chicken burgers")

# Connect Menu and Section
MenuSection.create!(menu: menu1, section: section1, display_order: 1)
MenuSection.create!(menu: menu1, section: section2, display_order: 2)
MenuSection.create!(menu: menu2, section: section3, display_order: 1)
MenuSection.create!(menu: menu2, section: section4, display_order: 2)

# Create Items
item1 = Item.create!(type: "Product", label: "Margherita Pizza", description: "Classic margherita pizza", price: 10.99)
item2 = Item.create!(type: "Product", label: "Pepperoni Pizza", description: "Savory pepperoni pizza", price: 12.99)
item3 = Item.create!(type: "Product", label: "Hawaiian Pizza", description: "Sweet and tangy Hawaiian pizza", price: 11.99)
item4 = Item.create!(type: "Product", label: "Classic Burger", description: "Juicy classic burger", price: 8.99)
item5 = Item.create!(type: "Product", label: "Cheeseburger", description: "Cheesy and delicious cheeseburger", price: 9.99)
item6 = Item.create!(type: "Product", label: "Spicy Chicken Burger", description: "Spicy chicken burger with a kick", price: 10.99)

# Create SectionItem
SectionItem.create!(section: section1, item: item1, display_order: 1)
SectionItem.create!(section: section1, item: item2, display_order: 2)
SectionItem.create!(section: section2, item: item3, display_order: 1)
SectionItem.create!(section: section3, item: item4, display_order: 1)
SectionItem.create!(section: section3, item: item5, display_order: 2)
SectionItem.create!(section: section4, item: item6, display_order: 1)

# Create Modifier Group
mg1 = ModifierGroup.create!(label: 'Size of Pizza', selection_required_min: 1, selection_required_max: 1)
mg2 = ModifierGroup.create!(label: 'Toppings', selection_required_min: 0, selection_required_max: 5)

mg3 = ModifierGroup.create!(label: 'Size of Burger', selection_required_min: 1, selection_required_max: 1)
mg4 = ModifierGroup.create!(label: 'Burger Toppings', selection_required_min: 0, selection_required_max: 5)

# Create ItemModifierGroup, Inject Modifier Group to Item
ItemModifierGroup.create!(item: item1, modifier_group: mg1)
ItemModifierGroup.create!(item: item2, modifier_group: mg1)
ItemModifierGroup.create!(item: item3, modifier_group: mg1)
ItemModifierGroup.create!(item: item1, modifier_group: mg2)
ItemModifierGroup.create!(item: item2, modifier_group: mg2)
ItemModifierGroup.create!(item: item3, modifier_group: mg2)
ItemModifierGroup.create!(item: item4, modifier_group: mg3)
ItemModifierGroup.create!(item: item5, modifier_group: mg3)
ItemModifierGroup.create!(item: item6, modifier_group: mg3)
ItemModifierGroup.create!(item: item4, modifier_group: mg4)
ItemModifierGroup.create!(item: item5, modifier_group: mg4)
ItemModifierGroup.create!(item: item6, modifier_group: mg4)

# Create Modifer
# Modifier Group : Size of Pizza
comp1 = Item.create!(type: "Component", label: 'Small Pizza', price: 0)
comp2 = Item.create!(type: "Component", label: 'Large Pizza', price: 4)

Modifier.create!(modifier_group: mg1, item: comp1, display_order: 1, default_quantity: 1)
Modifier.create!(modifier_group: mg1, item: comp2, display_order: 2, default_quantity: 1)

# Modifier Group : Toppings
comp3 = Item.create!(type: "Component", label: 'Extra Cheese', price: 1)
comp4 = Item.create!(type: "Component", label: 'Mushrooms', price: 0.5)

Modifier.create!(modifier_group: mg2, item: comp3, display_order: 1, default_quantity: 1)
Modifier.create!(modifier_group: mg2, item: comp4, display_order: 2, default_quantity: 1)

# Modifier Group : Size of Burger
comp5 = Item.create!(type: "Component", label: 'Small Burger', price: 0)
comp6 = Item.create!(type: "Component", label: 'Large Burger', price: 2)

Modifier.create!(modifier_group: mg3, item: comp5, display_order: 1, default_quantity: 1)
Modifier.create!(modifier_group: mg3, item: comp6, display_order: 2, default_quantity: 1)

# Modifier Group : Size of Pizza
comp7 = Item.create!(type: "Component", label: 'Lettuce', price: 0)
comp8 = Item.create!(type: "Component", label: 'Extra Tomato', price: 4)

Modifier.create!(modifier_group: mg4, item: comp7, display_order: 1, default_quantity: 1)
Modifier.create!(modifier_group: mg4, item: comp8, display_order: 2, default_quantity: 1)

# Output success message
puts "Seed data has been created successfully!"
