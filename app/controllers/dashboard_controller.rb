class DashboardController < ApplicationController
  skip_after_action :verify_authorized, only: [:listings, :rentals]

  def listings
    @cars = current_user.cars
    @bookings = policy_scope(Booking)
    @rentals = []
    @cars.each do |car|
      car.bookings.each do |b|
        @rentals << b
      end
    end

    @review = Review.new
  end

end
