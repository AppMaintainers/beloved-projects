# frozen_string_literal: true

class MagicLinksController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    skip_authorization

    message = verifier.verified(params[:token], purpose: :login)
    user = User.find_by(id: message[:user_id])

    if user
      sign_in(user)
      redirect_to after_sign_out_path_for(user)
    else
      flash[:alert] = 'There were some problem. PLease try again.'
      redirect_to new_user_session_path
    end
  end

  def create
    skip_authorization
    email = params[:user][:email]
    user = User.find_by(email: email)

    if user
      @login_token = verifier.generate({ user_id: user.id }, purpose: :login, expires_in: 15.minutes)
      MagicLinkMailer.login_instructions(@login_token, email).deliver
      flash[:notice] = 'We\'ve sent the magic lint to your email address.'
    else
      flash[:alert] = 'There is no user with this email address.'
    end

    redirect_to new_user_session_path
  end

  private

  def verifier
    Rails.application.message_verifier('magic_link')
  end
end
