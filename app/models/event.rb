class Event < ApplicationRecord
  serialize :days_of_week, Array

  enum event_category: {
    default: 0,
    focus: 1,
    meeting: 2,
  }

  enum event_type: {
    once: 0,
    recurring: 1,
  }
end
