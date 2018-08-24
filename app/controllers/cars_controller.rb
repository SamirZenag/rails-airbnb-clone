class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = policy_scope(Car)

    if params['/cars']
      @cars = Car.near(params['/cars']['address'], 40) if params['/cars']['address'].present?
      @cars = @cars.where(brand: params['/cars']['brand']) if params['/cars']['brand'].present?
      @cars = @cars.where(model: params['/cars']['model']) if params['/cars']['model'].present?
      # @cars = @cars.where(price: (price_wish = @cars.map{ |c| c.price }.min + (@cars.map{ |c| c.price }.max - @cars.map{ |c| c.price }.min)*params['/cars']['price'])) if params['/cars']['price'].present?
    end


    @brands = Car.all.map { |c| c.brand }.uniq
    @models = Car.all.map { |c| c.model }.uniq
    @prices = Car.all.map { |c| c.price }.uniq.sort
    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: { content: "<bold>#{car.model}</bold> \n #{car.address} \n #{car.city}" }
      }
    end
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @car = Car.find(params[:id])
    authorize @car
    @booking = Booking.new
  end

  def edit
    authorize @car
  end

  def update
    @car.update(car_params)
    authorize @car
    # no need for app/views/cars/create.html.erb
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    authorize @cars
    # no need for app/views/cars/destroy.html.erb
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :description, :price, :lat, :lng, :address, :city, :postal_code, :country, :photo)
  end

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end
end
