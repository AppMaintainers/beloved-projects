# frozen_string_literal: true

class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :load_form, only: [:create]

  def create
    # Accessible by users who are not logged in
    skip_authorization
    raise Pundit::NotAuthorizedError if @form.secret != params[:secret]

    if create_feedback
      redirect_to thank_you_path
    else
      flash[:alert] = 'No such form exists.'
      redirect_to root_path
    end
  end

  private

  def feedback_params
    params.fetch(:feedback, {}).permit(:form_id)
  end

  def load_form
    @form = Form.find_by(id: feedback_params[:form_id])
  end

  def create_feedback
    ApplicationRecord.transaction do
      feedback = Feedback.create
      params.fetch(:string_answers, []).each do |string_answer_params|
        string_answer_params
          .permit(:answer, :string_question_id)
          .merge(feedback: feedback)
          .then { StringAnswer.create(_1) }
      end
      params.fetch(:text_answers, []).each do |text_answer_params|
        text_answer_params
          .permit(:answer, :text_question_id)
          .merge(feedback: feedback)
          .then { TextAnswer.create(_1) }
      end
      params.fetch(:select_answers, []).each do |select_answer_params|
        select_answer_params
          .permit(:answer, :select_question_id)
          .merge(feedback: feedback)
          .then { SelectAnswer.create(_1) }
      end
      params.fetch(:scale_answers, []).each do |scale_answer_params|
        scale_answer_params
          .permit(:answer, :scale_question_id)
          .merge(feedback: feedback)
          .then { ScaleAnswer.create(_1) }
      end
      true
    end
  end
end
