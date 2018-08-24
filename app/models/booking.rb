class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  enum status: { pending: 0, accepted: 1, declined: 2 }
  has_many :reviews
end
