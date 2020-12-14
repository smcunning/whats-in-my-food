require 'rails_helper'

describe 'Food PORO' do
  it "has attributes" do
    food_data = {
            "gtinUpc": 12345,
            "description": "Apple",
            "brandOwner": "Dole",
            "ingredients": "Apple"
           }

    food = Food.new(food_data)
    expect(food.code).to eq(food_data[:gtinUpc])
    expect(food.description).to eq(food_data[:description])
    expect(food.brand).to eq(food_data[:brandOwner])
    expect(food.ingredients).to eq(food_data[:ingredients])
  end
end
