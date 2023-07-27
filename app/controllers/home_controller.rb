class HomeController < ApplicationController
  def index
    @projects = if params[:all] == "true"
                  policy_scope(Project.all)
                else
                  policy_scope(current_user.projects)
                end
  end
end
