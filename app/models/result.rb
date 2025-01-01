class Result < ApplicationRecord
  belongs_to :event
  has_one :user, through: :event
end
