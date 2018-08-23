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

  include PgSearch
  pg_search_scope :search_by_model_and_brand,
    against: [ :model, :brand ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :global_search,
      against: [ :model, :brand ],
      associated_against: {
        booking: [ :start_date, :end_date, :review, :rating ]
      },
      using: {
        tsearch: { prefix: true }
      }
end
