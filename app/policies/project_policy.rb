# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    admin? || record.maintainers.include?(user)
  end

  def show?
    admin? || record.maintainers.include?(user)
  end

  def update?
    admin? || record.maintainers.include?(user)
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        scope.joins(:maintainers).where(projects_users: { user_id: user.id })
      end
    end
  end
end
