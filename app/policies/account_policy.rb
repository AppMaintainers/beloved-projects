# frozen_string_literal: true

class AccountPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    admin? || record.project.maintainers.include?(user)
  end

  def update?
    admin? || record.project.maintainers.include?(user)
  end

  def destroy?
    admin? || record.project.maintainers.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
