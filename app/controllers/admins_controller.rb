# frozen_string_literal: true

class AdminsController < ApplicationController
  def create
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    (raise Pundit::NotAuthorizedError unless policy([:attributes, @user]).valid_admin?(true))
    redirect_to users_path
  end

  def destroy
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    (raise Pundit::NotAuthorizedError unless policy([:attributes, @user]).valid_admin?(false))
    redirect_to users_path
  end
end
