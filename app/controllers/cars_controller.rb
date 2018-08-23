class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = " \
      cars.brand ILIKE :query \
      OR cars.model ILIKE :query \
      "
      @cars = policy_scope(Car.where(sql_query, query: "%#{params[:query]}%"))
    else
      @cars = policy_scope(Car.all)
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
    authorize @car
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
