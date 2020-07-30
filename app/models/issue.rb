class Issue < ApplicationRecord
  validates_presence_of :number, :state
  validates_uniqueness_of :number

  has_many :notifications
  has_many :events, through: :notifications

  scope :by_number, -> (number) { where(number: number) }
end
