class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    ensure_correct_user
  end

  def edit
    @user = User.find(params[:id])
    ensure_correct_user
  end

  def update
    @user = User.find(params[:id])
    ensure_correct_user
    if @user.update(params.require(:user).permit(:name, :introduction, :image_user))
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

    def ensure_correct_user
      unless @user == current_user
        redirect_to user_path(current_user)
      end
    end
end
