# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    authorize User
    @users = policy_scope User.all
  end

  def show
    @user = authorize User.find_by(id: params[:id])
  end
end
