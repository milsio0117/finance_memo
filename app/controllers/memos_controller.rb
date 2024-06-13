class MemosController < ApplicationController

    def index
        @memos = Memo.order(created_at: :desc)
    end

    def new
    end

    def create
      @stock = Stock.find(params[:stock_id])
      @memo = @stock.memos.build(memo_params)
  
      if @memo.save
        render json: { memo: @memo.as_json.merge({ created_at: @memo.created_at.utc.iso8601 }) }, status: :created
      else
        render json: { errors: @memo.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @stock = Stock.find(params[:stock_id])
      @memo = Memo.find(params[:id])
      @memo.destroy
      redirect_to stock_path(@stock)
    end

    
      private
    
      def memo_params
        params.require(:memo).permit(:content)
      end

end