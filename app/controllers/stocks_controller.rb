class StocksController < ApplicationController
    before_action :set_stock, only: [:show, :edit, :update, :destroy, :archive, :unarchive]
    before_action :authenticate_user!
  
    def index
      @user = current_user
      @stocks = Stock.active
      @new_stock = Stock.new
      @memo = Memo.new
      if params[:id].present?
        @stock = Stock.find(params[:id])
        @memos = @stock.memos
      end
    end

    def history
      @user = current_user
      @archived_stocks = Stock.archived
    end

    def archive
      @stock.archived!
      redirect_to root_path
    end

    def unarchive
      @stock.active!
      redirect_to history_stocks_path, notice: 'Stock successfully restored to active status.'
    end
  
    def create
      query = stock_params[:ticker].blank? ? stock_params[:name] : stock_params[:ticker]
      service = CreateStockService.new(query, stock_params, current_user)
      if service.call
        redirect_to stock_path(service.stock), notice: 'Stock successfully created'
      else
        @stock = service.stock || Stock.new(stock_params)
        @stocks = Stock.active
        @user = current_user
        @memo = Memo.new
        flash.now[:alert] = service.error_message
        render :index, status: :unprocessable_entity
      end
    end
  
    def show
      @user = current_user
      @new_stock = Stock.new
      @memo = Memo.new
      @memos = @stock.memos.order(created_at: :desc)
      if params[:origin] == "history"
        @archived_stocks = Stock.archived
      else
        @stocks = Stock.active
      end
    end
  
    def destroy
      @stock.destroy
      redirect_to root_path
    end

    def add_image
      @stock = Stock.find(params[:id])
      @stock.images.attach(params[:stock][:images])
      redirect_to @stock
    end

    def remove_image
      @image = ActiveStorage::Attachment.find(params[:id])
      @image.purge
      redirect_to @image.record
    end
  
    private
  
    def set_stock
      @stock = Stock.find(params[:id])
    end
  
    def stock_params
      params.require(:stock).permit(:name, :ticker, :market, :industry, images: [], pdfs: [])
    end

  end