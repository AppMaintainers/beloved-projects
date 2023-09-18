# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :load_project
  before_action :load_link, only: [:edit, :update]

  def index
    @links = policy_scope @project.links
  end

  def new
    @link = authorize Link.new
  end

  def edit
  end

  def create
    @link = authorize @project.links.build(link_params)
    if @link.save
      flash[:notice] = 'Link created successfully!'
      redirect_to project_path(@project)
    else
      flash[:alert] = @link.errors.full_messages.join('. ')
      redirect_to new_project_link_path
    end
  end

  def update
    if @link.update(link_params)
      flash[:notice] = 'Link edited successfully!'
      redirect_to project_links_path(@project)
    else
      flash[:alert] = @link.errors.full_messages.join('. ')
      redirect_to edit_project_link_path(@project, @link)
    end
  end

  private

  def load_project
    @project = authorize Project.find_by(id: params[:project_id]), :show?
  end

  def load_link
    @link = authorize @project.links.find_by(id: params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :description)
  end
end
