class ModelsController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def new
    @model = Model.new
  end

  def create
    model = Model.new params[:model]
    model.user = current_user
    if model.save
      redirect_to model_path model
    else
      render action: :new
    end
  end

  def edit
    @model = Model.new
  end

  def update
    model = Model.find params[:id]
    if model and model.update_attributes params[:model]
      redirect_to model_path model
    else
      render action: :edit
    end
  end

  def show
    @model = Model.find params[:id]
  end

  def destroy
    model = Model.find params[:id]
    model.destroy
    redirect_to :root
  end
end
