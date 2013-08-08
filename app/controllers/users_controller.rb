class UsersController < ApplicationController
  def new
    unless user_signed_in?
      @user = User.new
    end
  end

  def create
    @user = User.new params[:user]
    if @user.save
      user_sign_in @user
      render action: :new
    else
      render action: :new
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to :root
  end
end
