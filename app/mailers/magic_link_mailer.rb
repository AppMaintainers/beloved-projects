# frozen_string_literal: true

class MagicLinkMailer < ApplicationMailer
  def login_instructions(token, email)
    @login_token = token
    mail(to: email, subject: 'Magic link login')
  end
end
