# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feedbacks' do
  describe 'Index' do
    let(:form) { create(:form) }
    let(:user) { create(:user, :admin) }

    before { login_as user }

    it 'displays successfully' do
      get feedbacks_path(feedback: { form_id: form.id })

      expect(response).to have_http_status :ok
    end
  end

  describe 'Create' do
    let(:form) { create(:form) }
    let(:feedback_params) { { feedback: { form_id: form.id } } }
    let(:secret_params) { { secret: form.secret } }

    context 'when mismatching secret' do
      let(:params) { feedback_params }

      it 'redirects not authorized' do
        post feedbacks_path, params: params

        expect(response).to redirect_to root_path
      end
    end

    context 'when submitting only feedback' do
      let(:params) { feedback_params.merge(secret_params) }

      it 'creates feedback' do
        expect { post feedbacks_path, params: params }
          .to change { Feedback.count }.by(1)
      end

      it 'redirects correclty' do
        post feedbacks_path, params: params

        expect(response).to redirect_to thank_you_path
      end
    end

    context 'when also submitting nested attributes' do
      let(:string_question) { create(:string_question, form: form) }
      let(:string_answer) do
        build(:string_answer, string_question: string_question).attributes.slice('answer', 'string_question_id')
      end
      let(:text_question) { create(:text_question, form: form) }
      let(:text_answer) do
        build(:text_answer, text_question: text_question).attributes.slice('answer', 'text_question_id')
      end
      let(:select_question) { create(:select_question, form: form) }
      let(:select_answer) do
        build(:select_answer, select_question: select_question).attributes.slice('answer', 'select_question_id')
      end
      let(:scale_question) { create(:scale_question, form: form) }
      let(:scale_answer) do
        build(:scale_answer, scale_question: scale_question).attributes.slice('answer', 'scale_question_id')
      end
      let(:params) do
        {
          secret: form.secret,
          feedback: {
            form_id: form.id,
            string_answers_attributes: [string_answer],
            text_answers_attributes: [text_answer],
            select_answers_attributes: [select_answer],
            scale_answers_attributes: [scale_answer]
          }
        }
      end

      it 'creates string answer' do
        expect { post feedbacks_path, params: params }
          .to change { StringAnswer.count }.by(1)
      end

      it 'creates select answer' do
        expect { post feedbacks_path, params: params }
          .to change { SelectAnswer.count }.by(1)
      end

      it 'creates scale answer' do
        expect { post feedbacks_path, params: params }
          .to change { ScaleAnswer.count }.by(1)
      end

      it 'creates text answer' do
        expect { post feedbacks_path, params: params }
          .to change { TextAnswer.count }.by(1)
      end
    end
  end
end
