require 'rails_helper'

describe StationSearch do
  let(:search) { StationSearch.new("80203") }

  it "exists" do
    expect(search).to be_a StationSearch
  end

  context "instance methods" do
    context "#stations" do
      it "returns a collection of station data" do
        expect(search.stations.count).to eq(10)
      end
    end
  end
end
