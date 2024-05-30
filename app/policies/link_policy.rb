# frozen_string_literal: true

class LinkPolicy < ApplicationPolicy
  def new?
    record.project.deactivated_at.nil?
  end

  def create?
    (admin? || record.project.maintainers.include?(user)) && record.project.deactivated_at.nil?
  end

  def update?
    (admin? || record.project.maintainers.include?(user)) && record.project.deactivated_at.nil?
  end

  def destroy?
    (admin? || record.project.maintainers.include?(user)) && record.project.deactivated_at.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
