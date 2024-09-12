# frozen_string_literal: true

class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :load_form, only: [:index, :create]

  def index
    @feedbacks = policy_scope(Feedback).where(form_id: @form)
  end

  def create
    # Accessible by users who are not logged in
    skip_authorization
    raise Pundit::NotAuthorizedError if @form.secret != params[:secret]

    feedback = Feedback.new(feedback_params)
    if feedback.save
      redirect_to thank_you_path
    else
      flash[:alert] = feedback.errors.full_messages.join('. ')
      redirect_to form_path(@form, secret: params[:secret])
    end
  end

  private

  def feedback_params
    params
      .fetch(:feedback, {})
      .permit(
        :form_id,
        string_answers_attributes: [:answer, :string_question_id],
        text_answers_attributes: [:answer, :text_question_id],
        select_answers_attributes: [:answer, :select_question_id],
        scale_answers_attributes: [:answer, :scale_question_id]
      )
  end

  def load_form
    @form = Form.find_by(id: feedback_params[:form_id])
  end
end
