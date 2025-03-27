# frozen_string_literal: true

class FormMailer < ApplicationMailer
  def send_form
    @user = params[:user]
    @form = params[:form]

    mail(to: @user.email, subject: 'AppMaintainers Feedback')
  end
end
