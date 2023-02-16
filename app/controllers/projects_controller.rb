class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def create
    @project = current_user.projects.build(project_params)
    @project.users << current_user
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to root_path
    else
      flash.now[:warning] = "#{@project.errors.full_messages.join('. ')}"
      render 'projects/new'
    end
  end

  def new
    @project = Project.new 
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash.now[:success] = 'Project updated successfully!'
      render 'projects/edit'
    else
      flash.now[:warning] = "#{@project.errors.full_messages.join('. ')}"
      render 'projects/edit'
    end

  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :status_id, :acquired_at)
    end
end
