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

      # mail(to: @user.mail, subject: 'Magic link login')

      render plain: magic_link_url(token: @login_token)
    else
      flash[:alert] = 'There is no user with this email address.'
      redirect_to new_user_session_path
    end
  end

  private

  def verifier
    Rails.application.message_verifier('magic_link')
  end
end
