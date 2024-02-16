# frozen_string_literal: true

if Rails.env.test?
  ActionMailer::Base.delivery_method = :test
else
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = { address: 'localhost', port: 1025 }
end
