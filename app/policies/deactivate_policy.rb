# frozen_string_literal: true

class DeactivatePolicy < ApplicationPolicy
  def destroy?
    admin? || user == record
  end
end
