# frozen_string_literal: true

class DeactivatesController < ApplicationController
  def destroy
    skip_authorization

    @user = User.find_by(id: params[:user_id])
    deactivated_at = DateTime.now

    raise Pundit::NotAuthorizedError unless policy([:attributes, @user]).valid_deactivated_at?(deactivated_at)

    ApplicationRecord.transaction do
      @user.update(deactivated_at: deactivated_at)
      @user.projects_users.delete_all
    end

    flash[:notice] = 'User deactivated successfully!'
    redirect_to users_path
  rescue ActiveRecord::RecordInvalid
    flash[:alert] = 'This user cannot be deactivated.'
  end
end
