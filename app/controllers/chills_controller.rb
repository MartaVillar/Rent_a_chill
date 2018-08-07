class ChillsController < ApplicationController
  def new
    @chill = Chill.new
  end

  def create
    @chill = Chill.new(chill_params)
    if @chill.save!
      Chill.create(chill_params)
      redirect_to chills_path
    else
      render :new
    end
  end

  private

  def chill_params
    params.require(:chill).permit(:title, :capacity, :price_per_hour, :location, :description, :category, :area, :chill_power, :user_id)
  end
end
