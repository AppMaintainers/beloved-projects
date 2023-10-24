# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def update?
    admin? || record.maintainers.include?(user)
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
