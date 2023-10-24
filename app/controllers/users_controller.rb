# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = authorize User.find_by(id: params[:id])
  end

  def index
    @users = policy_scope User.all
  end
end
