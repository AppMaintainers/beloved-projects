class UsersController < ApplicationController
  def show
    @user = authorize User.find_by(id: params[:id])
  end
end
