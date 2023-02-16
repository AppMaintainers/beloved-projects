class AccountsController < ApplicationController
  before_action :get_project
  
  def new
    @account = Account.new
  end

  def create
    @account = @project.accounts.build(account_params)
    if @account.save
      flash[:success] = "Account created successfully!"
      redirect_to new_project_account_path
    else
      flash.now[:warning] = "#{@account.errors.full_messages.join('. ')}"
      redirect_to new_project_account_path
    end
  end

private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def account_params
    params.require(:account).permit(:name, :description)
  end
end
