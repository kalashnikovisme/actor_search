class ScanningsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @scan = Scanning.new
  end

  def create
    @scan = Scanning.new params[:scanning]
    if @scan.save
      redirect_to scanning_path @scan
    else
      render action: :new
    end
  end

  def index
    @scan = Scanning.all
  end

  def show
    @scan = Scanning.find params[:id]
  end

  def destroy
    scan = Scanning.find params[:id]
    searcher = scan.searcher
    scan.destroy
    redirect_to searcher_path searcher
  end

end
