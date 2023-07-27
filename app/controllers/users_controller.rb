# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = authorize User.find_by(id: params[:id])
  end
end
