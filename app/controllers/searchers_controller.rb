class SearchersController < ApplicationController
  before_filter :authenticate_user!

  def new
    @searcher = Searcher.new
  end

  def create
    @searcher = Searcher.new params[:searcher]
    @searcher.user = User.find params[:id]
    if @searcher.save
      redirect_to searcher_path @searcher
    else
      render action: :new
    end
  end

  def show
    @searcher = Searcher.find params[:id]
  end

  def edit
    @searcher = Searcher.find params[:id]
  end

  def update
    @searcher = Searcher.find params[:id]
    if @searcher.update_attributes params[:searcher]
      redirect_to searcher_path @searcher
    else
      render action: :new
    end
  end

  def destroy
    searcher = Searcher.find params[:id]
    user = searcher.user
    searcher.destroy
    user.destroy
    redirect_to :root
  end
end
