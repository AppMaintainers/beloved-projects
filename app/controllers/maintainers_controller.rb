# frozen_string_literal: true

class MaintainersController < ApplicationController
  before_action :load_project

  def edit
    @users = policy_scope(User).where(users: { deactivated_at: nil })
  end

  def create
    user = User.find_by(id: params[:maintainer_id])
    if @project.maintainers << user
      flash[:info] = 'Maintainer added successfully!'
    else
      flash[:danger] = 'Something went wrong!'
    end
    redirect_to edit_project_maintainers_path
  end

  def destroy
    user = User.find_by(id: params[:maintainer_id])
    if @project.maintainers.destroy(user)
      flash[:info] = 'Maintainer removed successfully!'
    else
      flash[:danger] = 'Something went wrong!'
    end
    redirect_to edit_project_maintainers_path
  end

  private

  def load_project
    @project = authorize Project.find_by(id: params[:project_id]), :edit?
  end
end
