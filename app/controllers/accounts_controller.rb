class AccountsController < ApplicationController
  def show
    @account = User.find(params[:id])
    ensure_correct_user
  end

  private

  def ensure_correct_user
    unless @account == current_user
      redirect_to account_path(current_user)
    end
  end
end
