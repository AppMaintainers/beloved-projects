# frozen_string_literal: true

module Attributes
  class AttributePolicy < ApplicationPolicy
    def filter(hash)
      hash.each do |key, value|
        hash.delete(key) unless public_send(:"valid_#{key}?", value)
      end
    end

    private

    def method_missing(name, *args)
      name.start_with?('valid_') || super
    end

    def respond_to_missing?(name, *args)
      name.start_with?('valid_') || super
    end
  end
end
