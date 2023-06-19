class ProjectPolicy < ApplicationPolicy
  def new?
    true
  end

  def show?
    true
  end

  def update?
    record.users.include?(user)
  end

  def index?
    true
  end

end
