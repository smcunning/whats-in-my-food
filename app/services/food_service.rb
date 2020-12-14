class FoodService
  def self.food_list(search_term, result_quantity)
    results = conn.get('/fdc/v1/foods/search?') do |req|
      req.params[:query] = search_term
      req.params[:pageSize] = result_quantity
    end
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.nal.usda.gov/') do |f|
      f.params[:api_key] = ENV['FOODS_API_KEY']
    end
  end
end
