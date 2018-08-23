class Car < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  mount_uploader :photo, PhotoUploader

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :geocode, if: :city_changed?

  def full_address
    "#{address}, #{city}"
  end
end
