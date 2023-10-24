# frozen_string_literal: true

class AdminsController < ApplicationController

  def create
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    if policy([:attributes, @user]).valid_admin?(true)
      @user.update(admin: true)
    else
      raise Pundit::NotAuthorizedError
    end
    redirect_to users_path
  end

  def destroy
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    if policy([:attributes, @user]).valid_admin?(false)
      @user.update(admin: false)
    else
      raise Pundit::NotAuthorizedError
    end
    redirect_to users_path
  end
end
