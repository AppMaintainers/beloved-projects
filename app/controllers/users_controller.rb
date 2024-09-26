# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update]

  def index
    authorize User
    @users = policy_scope(User).order('LOWER(first_name), LOWER(last_name)')
  end

  def new
    @user = authorize User.new(params[:user]) # The user that we need is different from the user in user_params.
  end

  def edit
  end

  def create
    @user = User.new(password: SecureRandom.alphanumeric(32))
    policy([:attributes, @user]).filter(user_params).then { @user.assign_attributes(_1) }
    @user.auto_gen_password = true

    authorize @user

    @user.skip_confirmation!

    if @user.save
      flash[:notice] = 'User created successfully!'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_to new_user_path(user: user_params)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User edited successfully!'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params
      .fetch(:user, {})
      .then { policy([:attributes, @user]).filter(_1) }
      .permit(
        [:first_name, :last_name, :email]
          .then { current_user.admin? ? _1 << :admin : _1 }
      )
  end

  def load_user
    @user = authorize User.find_by(id: params[:id])
  end
end
