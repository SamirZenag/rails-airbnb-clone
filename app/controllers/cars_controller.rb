class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = policy_scope(Car)
  end

  def new
    @car = current_user.cars.new
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
