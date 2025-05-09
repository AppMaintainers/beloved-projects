# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :edit, :update, :destroy]

  def show
    @links = policy_scope(@project.links).order(updated_at: :desc).first(10)
  end

  def new
    @project = authorize Project.new(project_params)
  end

  def edit
  end

  def create
    @project = authorize current_user.projects.build(project_params)
    @project.maintainers << current_user

    if @project.save
      flash[:notice] = 'Project created successfully!'
      redirect_to root_path
    else
      flash[:alert] = @project.errors.full_messages.join('. ')
      redirect_to new_project_path(project: project_params)
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully!'
      redirect_to project_path(@project)
    else
      flash[:alert] = @project.errors.full_messages.join('. ')
      redirect_to edit_project_path
    end
  end

  def destroy
    if @project.update(deactivated_at: DateTime.now)
      flash[:notice] = 'Project deactivated successfully!'
      redirect_to root_path
    else
      flash[:alert] = 'This project cannot be deactivated.'
      redirect_to project_path(@project)
    end
  end

  private

  def project_params
    params
      .fetch(:project, {})
      .then { policy([:attributes, :project]).filter(_1) }
      .permit(
        [:title]
          .then { current_user.admin? ? _1 << :deactivated_at : _1 }
      )
  end

  def load_project
    @project = authorize Project.find_by(id: params[:id])
  end
end
