class FoodsController < ApplicationController
  def index
    search_term = params[:q]
    result_quantity = 10
    @foods = SearchFacade.food_list(search_term, result_quantity)
  end
end
