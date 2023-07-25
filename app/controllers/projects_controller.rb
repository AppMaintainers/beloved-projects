# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :edit, :update]

  def create
    @project = authorize current_user.projects.build(project_params)
    @project.maintainers << current_user

    if @project.save
      flash[:notice] = "Project created successfully!"
      redirect_to root_path
    else
      flash.now[:alert] = "#{@project.errors.full_messages.join('. ')}"
      render 'projects/new'
    end
  end

  def new
    @project = authorize Project.new
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash.now[:notice] = 'Project updated successfully!'
      render 'projects/edit'
    else
      flash.now[:alert] = "#{@project.errors.full_messages.join('. ')}"
      render 'projects/edit'
    end
  end

  private

    def project_params
      params.require(:project).permit(:title)
    end

    def load_project
      @project = authorize Project.find_by(id: params[:id])
    end
end
