# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Form Submission Workflow' do
  let(:form) { create(:form) }

  before do
    create(:string_question, form: form,
                             question: 'What is your name?')
    create(:text_question, form: form,
                           question: 'What is your job?')
    create(:select_question, form: form,
                             question: 'What is your favourite fruit?',
                             options: %w[peaches apples])
    create(:scale_question, form: form,
                            question: 'Could you round gravitational force to a whole number?')
  end

  # rubocop:disable RSpec/ExampleLength

  it 'redirects successfully' do
    visit form_path(form, secret: form.secret)
    fill_in('What is your name?', with: 'Sir Isaac Newton')
    fill_in('What is your job?', with: 'I am a physicist.')
    select('apples', from: 'What is your favourite fruit?')
    fill_in('Could you round gravitational force to a whole number?', with: 10)
    click_on('Submit')

    expect(page).to have_text('Thank you for your feedback!')
  end

  # rubocop:enable RSpec/ExampleLength
end
