class Event < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true

  enum :units,
    seconds: "seconds",
    kilograms: "kilograms",
    meters: "meters",
    integer: "integer"
end
