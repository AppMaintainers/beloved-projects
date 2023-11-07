# frozen_string_literal: true

module PolicyExampleGroup
  extend ActiveSupport::Concern

  included do
    require 'pundit/matchers'

    metadata[:type] = :policy

    subject(:policy) { described_class.new(user, object_to_check) }

    let(:resolved_scope) do
      described_class
        .new(user, class_to_check.all)
        .resolve
    end
  end

  RSpec.configure do |config|
    config.include self, type: :policy, file_path: %r{spec/policies}
  end
end
