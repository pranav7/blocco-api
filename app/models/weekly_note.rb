class WeeklyNote < ApplicationRecord
  validates :week_number, :week_year, presence: true
  serialize :blocks, JSON
end
