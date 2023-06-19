class HomeController < ApplicationController
  def index
    @projects = if params[:all] == "true"
                  policy_scope(Project.all)
                elsif signed_in?
                  policy_scope(current_user.projects)
                else
                  skip_policy_scope
                  []
                end
  end
end
