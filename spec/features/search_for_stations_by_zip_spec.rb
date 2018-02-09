require 'rails_helper'

feature "Search for stations by zip" do
  scenario "with a valid zip" do
    visit "/"
    fill_in "q", with: "80203"
    click_on "Locate"
    expect(current_path).to eq("/search")
    expect(current_url).to include("q=80203")
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css(".station", count: 10)
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_times")
    end
  end
end
