# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :edit, :update]

  def show
  end

  def new
    @project = authorize Project.new
  end

  def edit
  end

  def create
    @project = authorize current_user.projects.build(project_params)
    @project.maintainers << current_user

    if @project.save
      flash[:notice] = "Project created successfully!"
      redirect_to root_path
    else
      flash.now[:alert] = @project.errors.full_messages.join('. ').to_s
      render 'projects/new'
    end
  end

  def update
    if @project.update(project_params)
      flash.now[:notice] = 'Project updated successfully!'
    else
      flash.now[:alert] = @project.errors.full_messages.join('. ').to_s
    end
    render 'projects/edit'
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :status_id, :acquired_at)
  end

  def load_project
    @project = authorize Project.find_by(id: params[:id])
  end
end
