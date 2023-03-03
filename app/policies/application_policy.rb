# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    if @record.users.include? @user
  end

  def destroy?
    true
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present?
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end

    private

    attr_reader :user, :scope
  end
end
