# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:form_submission]

  def form_submission
    # Accessible by not authenticated actors
    skip_authorization
  end
end
