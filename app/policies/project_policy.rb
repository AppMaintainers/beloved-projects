class ProjectPolicy < ApplicationPolicy
  def update?
    @record.users.include? @user
  end

  class Scope < Scope
    # def resolve
    #   scope.all
    # end
  end
end
