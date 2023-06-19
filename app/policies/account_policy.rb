class AccountPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    record.project.users.include?(user)
  end

  class Scope < Scope

    def resolve
      scope.all
    end

  end
end
