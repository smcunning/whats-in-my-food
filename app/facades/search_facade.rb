class SearchFacade
  def self.food_list(search_term, result_quantity)
    foods = FoodService.food_list(search_term, result_quantity)
    foods[:foods].map do |food|
      Food.new(food)
    end
  end
end
