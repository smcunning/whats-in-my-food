class SearchFacade
  def self.food_list(search_term, result_quantity)
    foods = FoodService.food_list(search_term, result_quantity)
  end

  def self.create_food_objects(foods)
    foods[:foods].map do |food|
      Food.new(food)
    end
  end

  def self.total_results(foods)
    foods[:totalHits]
  end
end
