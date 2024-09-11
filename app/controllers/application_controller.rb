# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    permitted_attributes = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: permitted_attributes
    devise_parameter_sanitizer.permit :account_update, keys: permitted_attributes
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    if request.url == request.headers['Referer']
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
