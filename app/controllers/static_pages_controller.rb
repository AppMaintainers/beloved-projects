# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:form_submission]

  def form_submission
    # Accessible by users who are not logged in
    skip_authorization
  end
end
