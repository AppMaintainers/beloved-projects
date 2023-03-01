class HomeController < ApplicationController
  def index
    @projects = if params[:all] == "true" 
      Project.all
    else
      current_user.projects unless current_user.nil?
    end
  end
end
