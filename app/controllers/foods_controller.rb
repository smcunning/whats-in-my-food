class FoodsController < ApplicationController
  def index
    search_term = params[:q]
    result_quantity = 10
    @foods = SearchFacade.food_list(search_term, result_quantity)
    @total_foods = SearchFacade.total_foods(search_term)
  end
end
