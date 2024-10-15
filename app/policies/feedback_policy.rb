# frozen_string_literal: true

class FeedbackPolicy < ApplicationPolicy
  def index?
    admin?
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        scope.none
      end
    end
  end
end
