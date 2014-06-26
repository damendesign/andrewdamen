class UsersController < ApplicationController
before_action :logged_in_user,  only: [:index, :edit, :update, :destroy]
before_action :admin_user,      only: :destroy
before_action :correct_user,    only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    damned_user = User.find(params[:id])
    if (damned_user == current_user)
      flash[:danger] = "Sorry, you can't delete yourself!"
    else
      damned_user.destroy
      flash[:success] = "User deleted."
    end
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You successfully created your account!"
      redirect_to @user
    else
      flash[:warning] = "Error creating account."
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
