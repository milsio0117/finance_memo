require 'csv'

class CsvStockService
  def initialize
    @file_path = Rails.root.join('db', 'data', 'data_j.csv')
  end

  def fetch_stock_info(query)
    result = nil
    CSV.foreach(@file_path, headers: true) do |row|
      if row['銘柄名'] && (row['コード'] == query.to_s || row['銘柄名'].include?(query.to_s))
        result = { 'コード' => row['コード'], '銘柄名' => row['銘柄名'] , '33業種区分' => row['33業種区分'], '市場・商品区分' => row['市場・商品区分']}
        break
      end
    end
    result
  rescue => e
    Rails.logger.error "Failed to fetch stock info from CSV: #{e.message}"
    nil
  end
  
end