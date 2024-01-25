# frozen_string_literal: true

class DeactivatesController < ApplicationController

  def destroy
    @user = authorize User.find_by(id: params[:user_id]), :edit?
    if !@user.admin?
      @user.update(deactivated_at: DateTime.now)
    else
      raise Pundit::NotAuthorizedError
    end
    redirect_to users_path
  end
end
