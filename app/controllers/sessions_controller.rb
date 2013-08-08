class SessionsController < ApplicationController
  def new
    unless user_signed_in?
      @user = User.new
    end
  end

  def create
    user = User.find_by_login params[:user][:login]
    if user and authenticate_user?(user, params[:user][:password])
      user_sign_in user
      #EDITME
      redirect_to :root
    else
      flash[:error] = t('wrong_login')
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to :root
  end
end
