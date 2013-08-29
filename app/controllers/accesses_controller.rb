class AccessesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @accesses = Access.find_all_by_searcher_id params[:id]
  end

  def new
    @access = Access.new
  end

  def create
    @access = Access.new params[:access]
    @access.searcher = Searcher.find params[:id]
    if @access.save
      redirect_to accesses_path @access.searcher
    else
      render action: :new
    end
  end

  def destroy
    @access = Access.find params[:id]
    searcher = Searcher.find @access.searcher_id
    @access.destroy
    redirect_to searcher_path searcher
  end
end
