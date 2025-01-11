class Result < ApplicationRecord
  belongs_to :event
  has_one :user, through: :event

  validates :attempt_date, comparison: { less_than_or_equal_to: -> { Date.today }, message: "must not be in the future" }
  validates :score, comparison: { greater_than_or_equal_to: 1 }
end
