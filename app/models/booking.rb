class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :review
end
