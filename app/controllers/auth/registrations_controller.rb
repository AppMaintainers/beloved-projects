# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    # The default update is completed with the auto-generated password's case.
    # If the user never changed the auto-generated password before,
    # it does not need to know it for the first password change.
    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = if resource.auto_gen_password
                           resource.update(account_update_params.merge(auto_gen_password: false))
                         else
                           update_resource(resource, account_update_params)
                         end

      yield resource if block_given?
      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

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
