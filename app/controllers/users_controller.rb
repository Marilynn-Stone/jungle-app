class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Store all emails in lowercase to avoid duplicates and case-sensitive login errors.
    @user.email.downcase!  
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmations)
  end
  
end
