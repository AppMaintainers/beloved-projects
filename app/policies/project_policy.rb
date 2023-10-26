# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    record.maintainers.include?(user)
  end

  def update?
    admin? || record.maintainers.include?(user)
  end

  def index?
    record.maintainers.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
