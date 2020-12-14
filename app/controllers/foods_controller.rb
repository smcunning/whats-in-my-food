class FoodsController < ApplicationController
  def index
    search_term = params[:q]
    result_quantity = 10
    food_data = SearchFacade.food_list(search_term, result_quantity)
    @foods = SearchFacade.create_food_objects(food_data)
    @total_foods = SearchFacade.total_results(food_data)
  end
end
