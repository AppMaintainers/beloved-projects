# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def edit?
    admin? || user == record
  end

  def index?
    admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
