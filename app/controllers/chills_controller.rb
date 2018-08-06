class ChillsController < ApplicationController
  def index
    @chills = Chill.all
  end

  # def new
  #   @chill = Chill.new
  # end

  # def create
  #   chill = Chill.new(chill_params)
  #   chill.save
  #   redirect_to chills_path
  # end

  # def update
  #   @chill.update(chill_params)
  #   redirect_to chill_path(@chill)
  # end

  # def show
  # end

  # def destroy
  #   @chill.destroy
  #   redirect_to chills_path
  # end

  # private

  # def set_chill
  #   @chill = Chill.find(params[:id])
  # end

  # def chill_params
  #   params.require(:chill).permit(:name, :desciption, :price, :time)
  # end

end
