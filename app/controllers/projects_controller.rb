class ProjectsController < ApplicationController

  def create
    @project = current_user.projects.build()
  end

  def new
  end

  private

  def correct_user
    @project = current_user.projects.find_by(id: params[id])
    redirect_to root if @project.nil?
  end
end
