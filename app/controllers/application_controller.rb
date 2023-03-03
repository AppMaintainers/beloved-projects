class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    permitted_attributes = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: permitted_attributes
    devise_parameter_sanitizer.permit :account_update, keys: permitted_attributes
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to user_session_path 
  end
end
