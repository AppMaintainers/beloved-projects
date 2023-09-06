# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :load_project

  def index
    @accounts = policy_scope @project.accounts
  end

  def new
    @account = authorize Account.new
    @users = policy_scope(User)
  end

  def edit
    @users = policy_scope(User)
    @account = authorize @project.accounts.find_by(id: params[:id])
  end

  def create
    @account = authorize @project.accounts.build(account_params)
    if @account.save
      flash[:notice] = "Account created successfully!"
      redirect_to project_path(@project)
    else
      flash[:alert] = @account.errors.full_messages.join('. ')
      redirect_to new_project_account_path
    end
  end

  def update
    @account = authorize @project.accounts.find_by(id: params[:id])
    if @account.update(account_params)
      flash[:notice] = "Account edited successfully!"
      redirect_to project_accounts_path(@project)
    else
      flash[:alert] = @account.errors.full_messages.join('. ')
      redirect_to edit_project_account_path(@project, @account)
    end
  end

private

  def load_project
    @project = Project.find(params[:project_id])
  end

  def account_params
    params.require(:account).permit(:name, :domain, :organization, :services,
                                    :account_manager_id, :owner_request, :owner_request_notes,
                                    :mfa_supported, :description)
          .tap do |permitted_params|
      permitted_params[:services] = permitted_params[:services].split(',') if permitted_params[:services]
    end
  end
end
