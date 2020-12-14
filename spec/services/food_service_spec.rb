require 'rails_helper'

describe 'Food Service' do
  context "instance methods" do
    context "#food_list" do
      it "returns a list of foods by search term" do
        search = FoodService.food_list("sweet potatoes", 10)
        expect(search). to be_a Hash
        food_data = search[:foods].first

        expect(food_data).to have_key :gtinUpc
        expect(food_data).to have_key :description
        expect(food_data).to have_key :brandOwner
        expect(food_data).to have_key :ingredients
      end
    end
  end
end
