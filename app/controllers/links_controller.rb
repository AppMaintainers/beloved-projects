# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :load_project

  def index
    @links = policy_scope @project.links
  end

  def new
    @link = authorize Link.new
  end

  def create
    @link = authorize @project.links.build(link_params)
    if @link.save
      flash[:notice] = 'Link created successfully!'
      redirect_to project_path(@project)
    else
      flash[:alert] = @link.errors.full_messages.join('. ')
      redirect_to new_projects_links_path
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :description)
  end
end
