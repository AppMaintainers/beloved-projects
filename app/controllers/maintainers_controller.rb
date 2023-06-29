# frozen_string_literal: true

class MaintainersController < ApplicationController
  before_action :load_project
  def edit
  end

  def create
    user = User.find_by(id: params[:maintainer_id])
    @project.maintainers << user
    redirect_to edit_project_maintainers_path
  end

  def destroy
    user = User.find_by(id: params[:maintainer_id])
    @project.maintainers.destroy(user)
    redirect_to edit_project_maintainers_path
  end

  private

  def load_project
    @project = authorize Project.find_by(id: params[:project_id]), :edit?
  end
end
