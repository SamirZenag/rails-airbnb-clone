class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    @booking.price = ((@booking.end_date - @booking.start_date) + 1) * @car.price
    authorize(@booking)
    if @booking.save
      redirect_to car_path(@car)
    else
      render "cars/#{car.id}/show"
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    # no need for app/views/bookings/create.html.erb
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    # no need for app/views/bookings/destroy.html.erb
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 1
    flash[:notice] = "Your booking has been accepted"
    if @booking.save
      redirect_to dashboard_listings_path(@booking)
    else
      flash[:alert] = "Something went wrong"
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = 2
    flash[:alert] = "Your booking has been declined"
    if @booking.save
      redirect_to dashboard_listings_path(@booking)
    else
      flash[:alert] = "Something went wrong"
    end
  end

end
