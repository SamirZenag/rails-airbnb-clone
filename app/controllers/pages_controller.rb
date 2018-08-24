class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @brands = Car.all.map { |c| c.brand }.uniq
  end

  def dashboard
  end
end
