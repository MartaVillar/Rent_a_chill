class UsersController < ApplicationController
  layout 'application'
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo, :birthday, :description, :phone, :name)
  end
end
