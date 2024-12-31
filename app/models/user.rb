class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validate :age_must_be_over_18

  has_many :events, dependent: :destroy

  private

  def age_must_be_over_18
    if age.present? && age > 18.years.ago.to_date
      errors.add(:date_of_birth, "must be at least 18 years old")
    end
  end
end
