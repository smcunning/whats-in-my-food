require 'rails_helper'

describe "visitor searches for food" do
  before :each do
    visit "/"
    fill_in :q, with: "sweet potatoes"
    click_on "Search"
  end

  it 'can see a total number of items returned by the search' do
    expect(current_path).to eq("/foods")

    expect(page).to have_content("10 Foods")
  end

  it 'can see a list of ten foods that contain the ingredient searched for' do
    expect(page).to have_css(".food", count: 10)
  end

  it 'has details for each of the foods' do
    within(first(".food")) do
      expect(page).to have_css(".gtin-upc")
      expect(page).to have_css(".description")
      expect(page).to have_css(".brand-owner")
      expect(page).to have_css(".ingredients")
    end
  end
end


# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
