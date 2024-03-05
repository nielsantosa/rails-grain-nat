DELETE FROM section_items;
DELETE FROM menu_sections;
DELETE FROM sections;
DELETE FROM menus;
DELETE FROM item_modifier_groups;
DELETE FROM modifiers;
DELETE FROM items;
DELETE FROM modifier_groups;

ALTER SEQUENCE section_items_id_seq RESTART WITH 1;
ALTER SEQUENCE menu_sections_id_seq RESTART WITH 1;
ALTER SEQUENCE sections_id_seq RESTART WITH 1;
ALTER SEQUENCE menus_id_seq RESTART WITH 1;
ALTER SEQUENCE item_modifier_groups_id_seq RESTART WITH 1;
ALTER SEQUENCE modifiers_id_seq RESTART WITH 1;
ALTER SEQUENCE items_id_seq RESTART WITH 1;
ALTER SEQUENCE modifier_groups_id_seq RESTART WITH 1;

-- Create Menus
INSERT INTO public.menus (id, label, state, start_date, end_date, created_at, updated_at)
VALUES (1, 'Pizza Menu', 'active', '2024-03-01', '2024-03-31', '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM menus;

-- Create Sections
INSERT INTO public.sections (id, label, description, created_at, updated_at)
VALUES
(1, 'Classic Pizzas', 'Delicious classic pizzas', '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
(2, 'Specialty Pizzas', 'Unique and flavourful pizzas', '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM sections;

-- Connect Menu and Section
INSERT INTO menu_sections (id, menu_id, section_id, display_order, created_at, updated_at)
VALUES (1, (SELECT id FROM menus WHERE label = 'Pizza Menu'), (SELECT id FROM sections WHERE label = 'Classic Pizzas'), 1, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (2, (SELECT id FROM menus WHERE label = 'Pizza Menu'), (SELECT id FROM sections WHERE label = 'Specialty Pizzas'), 2, '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM menu_sections;

-- Create Items
INSERT INTO items (id, type, label, description, price, created_at, updated_at)
VALUES (1, 'Product', 'Margherita Pizza', 'Classic margherita pizza', 10.99, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (2, 'Product', 'Pepperoni Pizza', 'Savory pepperoni pizza', 12.99, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (3, 'Product', 'Hawaiian Pizza', 'Sweet and tangy Hawaiian pizza', 11.99, '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM items;

-- Create SectionItems
INSERT INTO section_items (id, section_id, item_id, display_order, created_at, updated_at)
VALUES (1, (SELECT id FROM sections WHERE label = 'Classic Pizzas'), (SELECT id FROM items WHERE label = 'Margherita Pizza'), 1, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (2, (SELECT id FROM sections WHERE label = 'Classic Pizzas'), (SELECT id FROM items WHERE label = 'Pepperoni Pizza'), 2, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (3, (SELECT id FROM sections WHERE label = 'Specialty Pizzas'), (SELECT id FROM items WHERE label = 'Hawaiian Pizza'), 1, '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM section_items;

-- Create Modifier Groups
INSERT INTO modifier_groups (id, label, selection_required_min, selection_required_max, created_at, updated_at)
VALUES (1, 'Size of Pizza', 1, 1, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (2, 'Toppings', 0, 5, '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM modifier_groups;

-- Create ItemModifierGroup, Inject Modifier Group to Item
INSERT INTO item_modifier_groups (id, item_id, modifier_group_id, created_at, updated_at)
VALUES (1, (SELECT id FROM items WHERE label = 'Margherita Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Size of Pizza'), '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (2, (SELECT id FROM items WHERE label = 'Pepperoni Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Size of Pizza'), '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (3, (SELECT id FROM items WHERE label = 'Hawaiian Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Size of Pizza'), '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (4, (SELECT id FROM items WHERE label = 'Margherita Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Toppings'), '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (5, (SELECT id FROM items WHERE label = 'Pepperoni Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Toppings'), '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (6, (SELECT id FROM items WHERE label = 'Hawaiian Pizza'), (SELECT id FROM modifier_groups WHERE label = 'Toppings'), '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM item_modifier_groups;

-- Create Modifiers
INSERT INTO items (id, type, label, description, price, created_at, updated_at)
VALUES (4, 'Component', 'Small Pizza', 'Small size', 0.00, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (5, 'Component', 'Large Pizza', 'Large size', 4.00, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (6, 'Component', 'Extra Cheese', 'Extra cheese', 2.01, '2024-03-05 10:00:00', '2024-03-05 10:00:00'),
       (7, 'Component', 'Mushroom', 'Mushroom room', 2.03, '2024-03-05 10:00:00', '2024-03-05 10:00:00');

SELECT * FROM items;

INSERT INTO modifiers (id, item_id, modifier_group_id, display_order, default_quantity, price_override, created_at, updated_at) VALUES
    (1, 4, 1, 1, 1, NULL, current_timestamp, current_timestamp),
    (2, 5, 1, 2, 1, NULL, current_timestamp, current_timestamp),
    (3, 6, 2, 1, 1, NULL, current_timestamp, current_timestamp),
    (4, 7, 2, 2, 1, NULL, current_timestamp, current_timestamp);
SELECT * FROM modifiers;
