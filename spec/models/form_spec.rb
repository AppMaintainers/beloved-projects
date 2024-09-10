# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Form do
  describe 'Form' do
    let(:form) { create(:form) }

    context 'when created' do
      it 'has secret' do
        expect(form.secret).to be_present
      end
    end
  end
end
