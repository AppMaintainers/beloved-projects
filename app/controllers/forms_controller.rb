# frozen_string_literal: true

class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :load_form, only: [:show]

  def index
    @forms = policy_scope(Form)
  end

  def show
    # Accessible by users who are not logged in
    skip_authorization
    raise Pundit::NotAuthorizedError if @form.secret != params[:secret]

    @questions = [
      @form.string_questions.to_a,
      @form.text_questions.to_a,
      @form.select_questions.to_a,
      @form.scale_questions.to_a
    ].flatten.sort_by(&:order)
  end

  private

  def load_form
    @form = Form.find_by(id: params[:id])
  end
end
