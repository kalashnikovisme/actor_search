class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      user_sign_in @user
      redirect_to user_path @user
    else
      render action: :new
    end
  end

  def show
    actor = Actor.find_by_user_id params[:id]
    model = Model.find_by_user_id params[:id]
    #FIXME
    redirect_to actor_path actor if actor
    redirect_to model_path model if model

    unless actor or model
      @user = User.find params[:id]
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to :root
  end
end
