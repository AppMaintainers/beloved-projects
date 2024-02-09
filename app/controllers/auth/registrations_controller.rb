# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    # The default destroy is changed to only deactivate the user, based on the official devise github
    def destroy
      resource.update!(deactivated_at: DateTime.now) if resource.deactivated_at.blank?
      sign_out
      set_flash_message! :notice, :destroyed
      respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = 'Your account cannot be deactivated.'
      redirect_to edit_user_registration_path
    end
  end
end
