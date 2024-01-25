# frozen_string_literal: true

class DeactivatesController < ApplicationController
  def destroy
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    if @user.admin?
      raise Pundit::NotAuthorizedError
    else
      @user.update(deactivated_at: DateTime.now)
    end

    redirect_to users_path
  end
end
