class ActorsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @actors = ActorDecorator.decorate_collection  Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    actor = Actor.new params[:actor]
    actor.user = current_user
    if actor.save
      redirect_to actor_path actor
    else
      render action: :new
    end
  end

  def edit
    @actor = Actor.new
  end

  def update
    actor = Actor.find params[:id]
    if actor and actor.update_attributes params[:actor]
      redirect_to actor_path actor
    else
      render action: :edit
    end
  end

  def show
    @actor = Actor.find(params[:id]).decorate
  end

  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to :root
  end
end
