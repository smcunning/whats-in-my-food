class FoodsController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.nal.usda.gov/') do |f|
      f.params[:api_key] = ENV['FOODS_API_KEY']
    end

    results = conn.get('/fdc/v1/foods/search?') do |req|
      req.params[:query] = params[:q]
      req.params[:pageSize] = 10
    end

    food_list = JSON.parse(results.body, symbolize_names: true)

    @foods = food_list[:foods]
    require "pry"; binding.pry
  end
end