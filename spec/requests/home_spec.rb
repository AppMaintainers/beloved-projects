# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  let(:user) { create(:user) }

  before { login_as user }

  it 'display is successful' do
    get root_path

    expect(response).to have_http_status :ok
  end
end
