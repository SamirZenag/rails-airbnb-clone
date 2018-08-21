class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @car.update(car_params)
    # no need for app/views/cars/create.html.erb
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    # no need for app/views/cars/destroy.html.erb
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :description, :price, :lat, :lng, :address, :city, :postal_code, :country)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
