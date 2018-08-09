class ChillsController < ApplicationController
skip_before_action :authenticate_user!, only: :index

  # include PgSearch
  # multisearchable against: [ :title, :syllabus ]

  # pg_search_scope :search_by_title_and_syllabus,
  #   against: [ :title,  ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }


  def index
    @chills = Chill.all
    if params[:query].present?
      @chills_location = Chill.where("location ILIKE ?", "%#{params[:query]}%")
      @chills_category = Chill.where("category ILIKE ?", "%#{params[:query]}%")
      if @chills_category.length > @chills_location.length
        @chills = @chills_category
      elsif @chills_category.length + @chills_location.length == 0
        @chills = []
      else
        @chills = @chills_location
      end
    end
    if @chills.empty?
      flash.now[:notice] = "Please try again..."
      @chills = Chill.all
    end
    @chills
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

  def show
    @chill = Chill.find(params[:id])
  end

  private

  def chill_params
    params.require(:chill).permit(:title, :capacity, :price_per_hour, :location, :description, :category, :user_id)
  end


end
