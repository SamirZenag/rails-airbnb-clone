class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
