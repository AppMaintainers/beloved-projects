# frozen_string_literal: true

class DeactivatesController < ApplicationController
  def destroy
    @user = User.find_by(id: params[:user_id])

    if policy([:attributes, @user]).valid_deactivated_at?(DateTime.now)
      skip_authorization

      if @user.update(deactivated_at: DateTime.now)
        flash[:notice] = 'User deactivated successfully!'
      else
        flash[:alert] = 'This user cannot be deactivated.'
      end

      redirect_to users_path
    else
      raise Pundit::NotAuthorizedError
    end
  end
end
