# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    admin? || (record.maintainers.include?(user) && record.deactivated_at.nil?)
  end

  def update?
    admin? || (record.maintainers.include?(user) && record.deactivated_at.nil?)
  end

  def destroy?
    admin? || (record.maintainers.include?(user) && record.deactivated_at.nil?)
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        scope.joins(:projects_users)
          .where(projects_users: { user_id: user.id })
          .where(projects: { deactivated_at: nil })
      end
    end
  end
end
