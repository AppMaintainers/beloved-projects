class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @project = current_user.projects.build(project_params)
    @project.users << current_user
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to root_url
    else
      flash[:warning] = "Project could not be created for some reason."
      redirect_to root_url
    end
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  private

    def project_params
      params.require(:project).permit(:title, :context, :status_id)
    end
end
