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

  def destroy?
    admin? || record.maintainers.include?(user)
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.where(projects: { deactivated_at: nil })
      else
        scope.where(projects: { deactivated_at: nil })
          .joins(:projects_users).where(projects_users: { user_id: user.id })
      end
    end
  end

  def valid_deactivated_at?(next_value)
    if next_value.present?
      admin? || record.maintainers.include?(user)
    else
      false
    end
  end
end
