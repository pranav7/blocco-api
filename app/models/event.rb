class Event < ApplicationRecord
  enum event_type: {
    default: 0,
    focus: 1,
    meeting: 2,
  }
end
