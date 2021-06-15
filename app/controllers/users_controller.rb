class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  @users = User.all
  @book = Book.new
  @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:'successfully'
    else
    render :edit
    end
  end


  private

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user.id)
    end
  end
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
