class WeeklyNote < ApplicationRecord
  validates :start_date, :end_date, presence: true
  serialize :blocks, JSON
end
