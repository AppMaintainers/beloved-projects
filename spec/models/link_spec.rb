# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link do
  it { is_expected.to allow_value('https://github.com').for(:url) }
  it { is_expected.to allow_value('http://127.0.0.1:3000').for(:url) }
  it { is_expected.not_to allow_value('https://').for(:url) }
  it { is_expected.not_to allow_value('github.com').for(:url) }
  it { is_expected.not_to allow_value('https://.com').for(:url) }
  it { is_expected.not_to allow_value('fake.site/https://click.me').for(:url) }
end
