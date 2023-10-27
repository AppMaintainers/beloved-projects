# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user
  attr_reader :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'must be logged in' unless user

    @user   = user
    @record = record
  end

  def new?
    false
  end

  def create?
    new?
  end

  def show?
    false
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def destroy?
    false
  end

  def index?
    false
  end

  def admin?
    user.admin
  end

  class Scope
    attr_reader :user
    attr_reader :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, 'must be logged in' unless user

      @user  = user
      @scope = scope
    end

    def method_missing(symbol, *args)
      policy = ApplicationPolicy.new(user, nil)
      policy.respond_to?(symbol, true) ? policy.send(symbol) : super
    end

    def respond_to_missing?(symbol)
      super || ApplicationPolicy.new(user, nil).respond_to?(symbol, true)
    end

    def resolve
      scope.none
    end
  end
end
