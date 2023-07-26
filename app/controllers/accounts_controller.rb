# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :load_project
  
  def new
    @account = authorize Account.new
  end

  def create
    @account = authorize @project.accounts.build(account_params)
    if @account.save
      flash[:notice] = "Account created successfully!"
      redirect_to project_path(@project)
    else
      flash[:alert] = "#{@account.errors.full_messages.join('. ')}"
      redirect_to new_project_account_path
    end
  end

  private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def account_params
    params.require(:account).permit(:name, :description)
  end
end
