require_relative "../lib/enums/enums"

class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  validates :label, presence: true
  validates :state, inclusion: { in: [MenuStateEnums::ACTIVE, MenuStateEnums::DELETED] }
  # validate start date and end date
  validate :start_date_and_end_time_is_a_date
  validate :validate_start_date_before_end_date

  def validate_start_date_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "cannot be after the end date")
    end
  end

  def start_date_and_end_time_is_a_date
    [start_date, end_date].each do |field_date|
      if field_date.present? && !field_date.is_a?(Date)
        errors.add(:base, 'start_date or end_date must be a valid datetime')
      end
    end
  end
end
