# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static Pages' do
  describe 'Form Submission' do
    it 'displays successfully' do
      get thank_you_path

      expect(response).to have_http_status :ok
    end
  end
end
