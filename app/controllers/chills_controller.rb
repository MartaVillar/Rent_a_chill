class ChillsController < ApplicationController
layout 'index_layout', :only => [:index]

  def index
    @chills = Chill.all
  end

  def new
    @chill = Chill.new
  end

  def create
    @chill = Chill.new(chill_params)
    @chill.user = current_user
    if @chill.save!
      Chill.create(chill_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def chill_params
    params.require(:chill).permit(:title, :capacity, :price_per_hour, :location, :description, :category, :area, :chill_power, :user_id)
  end


end