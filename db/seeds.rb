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
section1 = Section.create!(label: "Classic Pizzas", description: "Delicious classic pizzas", menu: menu1)
section2 = Section.create!(label: "Specialty Pizzas", description: "Unique and flavorful pizzas", menu: menu1)
section3 = Section.create!(label: "Beef Burgers", description: "Mouth-watering beef burgers", menu: menu2)
section4 = Section.create!(label: "Chicken Burgers", description: "Tasty chicken burgers", menu: menu2)

# Create Items
item1 = Item.create!(type: "Product", label: "Margherita Pizza", description: "Classic margherita pizza", price: 10.99, section: section1)
item2 = Item.create!(type: "Product", label: "Pepperoni Pizza", description: "Savory pepperoni pizza", price: 12.99, section: section1)
item3 = Item.create!(type: "Product", label: "Hawaiian Pizza", description: "Sweet and tangy Hawaiian pizza", price: 11.99, section: section2)
item4 = Item.create!(type: "Product", label: "Classic Burger", description: "Juicy classic burger", price: 8.99, section: section3)
item5 = Item.create!(type: "Product", label: "Cheeseburger", description: "Cheesy and delicious cheeseburger", price: 9.99, section: section3)
item6 = Item.create!(type: "Product", label: "Spicy Chicken Burger", description: "Spicy chicken burger with a kick", price: 10.99, section: section4)

# Create Modifier Group
size_group = ModifierGroup.create!(label: 'Size of Pizza', selection_required_min: 1, selection_required_max: 1)
toppings_group = ModifierGroup.create!(label: 'Toppings', selection_required_min: 0, selection_required_max: 5)

# Create ItemModifierGroup, Inject Modifier Group to Item
[item1, item2, item3, item4, item5, item6].each do |item|
  item.modifier_groups << size_group
  item.modifier_groups << toppings_group
end

# Create Modifer
# Modifier Group : Size of Pizza
comp1 = Item.create!(type: "Component", label: 'Small Pizza', price: 0)
comp2 = Item.create!(type: "Component", label: 'Large Pizza', price: 4)

modifier_small_size = Modifier.create!(modifier_group: size_group, item: comp1)
modifier_large_size = Modifier.create!(modifier_group: size_group, item: comp2)

# Modifier Group : Toppings
comp3 = Item.create!(type: "Component", label: 'Extra Cheese', price: 1)
comp4 = Item.create!(type: "Component", label: 'Mushrooms', price: 0.5)

modifier_cheese = Modifier.create!(modifier_group: toppings_group, item: comp3)
modifier_mushrooms = Modifier.create!(modifier_group: toppings_group, item: comp4)

# Output success message
puts "Seed data has been created successfully!"
