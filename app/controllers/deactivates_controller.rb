# frozen_string_literal: true

class DeactivatesController < ApplicationController
  def destroy
    @user = authorize(User.find_by(id: params[:user_id]), policy_class: DeactivatePolicy)
    if @user.update(deactivated_at: DateTime.now)
      flash[:notice] = 'User deactivated successfully!'
    else
      flash[:alert] = 'This user cannot be deactivated.'
    end

    redirect_to users_path
  end
end
