# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :load_project
  before_action :load_account, only: [:edit, :update, :destroy]

  def index
    @accounts = policy_scope @project.accounts
  end

  def new
    @account = authorize @project.accounts.new(account_params)
    @users = policy_scope(User)
  end

  def edit
    @users = policy_scope(User)
  end

  def create
    @account = authorize @project.accounts.build(account_params)
    if @account.save
      flash[:notice] = 'Account created successfully!'
      redirect_to project_path(@project)
    else
      flash[:alert] = @account.errors.full_messages.join('. ')
      redirect_to new_project_account_path(account: account_params)
    end
  end

  def update
    if @account.update(account_params)
      flash[:notice] = 'Account edited successfully!'
      redirect_to project_accounts_path(@project)
    else
      flash[:alert] = @account.errors.full_messages.join('. ')
      redirect_to edit_project_account_path(@project, @account)
    end
  end

  def destroy
    if @account.destroy
      flash[:notice] = 'Account removed successfully!'
    else
      flash[:danger] = @account.errors.full_messages.join('. ')
    end
    redirect_to project_accounts_path(@project)
  end

  private

  def load_project
    @project = authorize Project.find_by(id: params[:project_id]), :show?
  end

  def load_account
    @account = authorize @project.accounts.find_by(id: params[:id])
  end

  def account_params
    params
      .fetch(:account, {})
      .permit(:name, :domain, :organization, :services,
              { account_manager_ids: [] }, :owner_request,
              :owner_request_notes, :mfa_supported, :description)
      .tap do |permitted_params|
      permitted_params[:services] = permitted_params[:services].split(',') if permitted_params[:services]
    end
  end
end
