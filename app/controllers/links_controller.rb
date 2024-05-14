# frozen_string_literal: true

class LinksController < ApplicationController
  before_action :load_project
  before_action :load_link, only: [:edit, :update, :destroy]

  def index
    @links = policy_scope(@project.links).order('LOWER(title)')
  end

  def new
    @link = authorize Link.new(link_params)
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
      redirect_to new_project_link_path(link: link_params)
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

  def destroy
    if @project.links.destroy(@link)
      flash[:notice] = 'Link removed successfully!'
    else
      flash[:danger] = 'Something went wrong!'
    end
    redirect_to project_links_path(@project)
  end

  private

  def load_project
    @project = authorize Project.find_by(id: params[:project_id]), :show?
  end

  def load_link
    @link = authorize @project.links.find_by(id: params[:id])
  end

  def link_params
    params.fetch(:link, {}).permit(:title, :url, :description)
  end
end
