# frozen_string_literal: true

class LinkPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    record.project.maintainers.include?(user)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
