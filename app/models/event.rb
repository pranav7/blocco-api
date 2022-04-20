class Event < ApplicationRecord
  has_one :recurring_event

  enum event_type: {
    default: 0,
    focusTime: 1,
    outOfOffice: 2,
    break: 3,
  }

  enum status: {
    confirmed: 0,
    tentative: 1,
    cancelled: 2,
  }
end
