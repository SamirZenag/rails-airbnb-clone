class DashboardController < ApplicationController
  skip_after_action :verify_authorized, only: [:listings, :rentals]

  def listings
    @cars = current_user.cars
    @bookings = policy_scope(Booking)
  end
end
