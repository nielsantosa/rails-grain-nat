class Section < ApplicationRecord
  has_one :menu_section, dependent: :destroy
  has_one :menu, through: :menu_section

  has_many :section_items
  has_many :items, through: :section_items

  validates :label, presence: true
end
