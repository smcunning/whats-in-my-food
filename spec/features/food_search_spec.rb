require 'rails_helper'

describe "visitor searches for food" do
  before :each do
    visit "/"
    fill_in :q, with: "sweet potatoes"
    click_on "Search"
  end

  it 'can see a total number of items returned by the search' do
    expect(current_path).to eq("/foods")
    expect(page).to have_content("39244 Foods")
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
