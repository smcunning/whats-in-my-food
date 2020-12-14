require 'rails_helper'

describe 'Search Facade' do
  it 'returns a list of searched food objects' do
    foods = SearchFacade.food_list("Sweet Potatoes", 10)

    expect(foods).to be_a(Hash)
    expect(foods).to have_key :foods
    expect(foods[:foods].first).to have_key :gtinUpc
    expect(foods[:foods].first).to have_key :description
    expect(foods[:foods].first).to have_key :brandOwner
    expect(foods[:foods].first).to have_key :ingredients
  end

  it 'can create food objects' do
    foods = SearchFacade.food_list("Sweet Potatoes", 10)
    food_objects = SearchFacade.create_food_objects(foods)

    expect(food_objects.first).to be_an_instance_of(Food)
  end

  it 'can get total_results' do
    foods = SearchFacade.food_list("Sweet Potatoes", 10)
    total_results = SearchFacade.total_results(foods)

    expect(total_results).to be_an Integer
  end
end
