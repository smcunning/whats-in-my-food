require 'rails_helper'

describe 'Search Facade' do
  it 'returns a list of searched food objects' do
    foods = SearchFacade.food_list("Sweet Potatoes", 10)

    expect(foods).to be_a(Hash)
    expect(foods.size).to eq(10)
    expect(food.first).to be_an_instance_of(Food)
  end
end
