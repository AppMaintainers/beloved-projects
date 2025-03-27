# frozen_string_literal: true

class FormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :load_form, only: [:send_form]

  def index
    @forms = policy_scope(Form)
  end

  def show
    @form = Form.find_by(id: params[:id])

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

  def send_form
    @form.project.maintainers
      .where(users: { admin: false })
      .find_each do |user|
        FormMailer.with(user: user, form: @form).send_form.deliver
      end
    flash[:notice] = 'Form sent to Maintainers!'
    redirect_to forms_path
  end

  private

  def load_form
    @form = authorize Form.find_by(id: params[:id])
  end
end
