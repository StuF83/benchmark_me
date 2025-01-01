class Event < ApplicationRecord
  belongs_to :user
  has_many :results, dependent: :destroy

  validates :name, presence: :true
  validates :description, presence: :true
end
