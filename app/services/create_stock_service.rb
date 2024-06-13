class CreateStockService
    attr_reader :stock, :error_message
  
    def initialize(query, stock_params, current_user)
      @query = query
      @stock_params = stock_params
      @user = current_user
    end
  
    def call
      csv_service = CsvStockService.new
      stock_data = csv_service.fetch_stock_info(@query)
      return false unless stock_data
      
      @stock = Stock.new(
        name: stock_data['銘柄名'],
        ticker: stock_data['コード'],
        market: stock_data['市場・商品区分'],
        industry: stock_data['33業種区分'],
        user: @user
        )
      @stock.images.attach(@stock_params[:images]) if @stock_params[:images].present?
      @stock.pdfs.attach(@stock_params[:pdfs]) if @stock_params[:pdfs].present?
  
      if @stock.save
        true
      else
        @error_message = 'Failed to save stock'
        false
      end
    rescue => e
      @error_message = "Failed to fetch stock information: #{e.message}"
      false
    end
end