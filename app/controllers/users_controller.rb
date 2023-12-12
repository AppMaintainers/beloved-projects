# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    authorize User
    @users = policy_scope(User).order('LOWER(first_name), LOWER(last_name)')
  end

  def new
    @user = authorize User.new
  end

  def edit
    @user = authorize User.find_by(id: params[:id])
  end

  def create
    @user = User.new(password: SecureRandom.alphanumeric(32))
    policy([:attributes, @user]).filter(user_params).then { @user.assign_attributes(_1) }

    authorize @user

    if @user.save
      flash[:notice] = 'User created successfully!'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_to new_user_path
    end
  end

  def update
    @user = authorize User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User edited successfully!'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_to edit_users_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :admin)
  end
end
