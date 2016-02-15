# Users controller
class UsersController < ApplicationController
  before_action :current_resourse,
                only: [:show, :edit, :update, :change_permission, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for singning up!'
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to :back
  end

  def edit
  end

  def change_permission
    @user.update(admin: !@user.admin)
    redirect_to :back
  end

  private

  def current_resourse
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :lastname, :email,
                                 :password, :password_confirmation,
                                 :avatar, :admin)
  end
end
