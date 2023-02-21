class HomeController < ApplicationController
  def index
    @projects = if params[:all] == "true"
      Project.all
    else
      current_user.projects
    end
  end
end
