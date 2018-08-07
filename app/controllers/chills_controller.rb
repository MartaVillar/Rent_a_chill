class ChillsController < ApplicationController

  def index
   @chills = Chill.all
  end



end
