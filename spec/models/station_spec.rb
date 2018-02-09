require 'spec_helper'

describe Station do
  it "exists" do
    attrs = {
      :access_days_time=>"24 hours daily",
      :fuel_type_code=>"ELEC",
      :station_name=>"UDR",
      :city=>"Denver",
      :state=>"CO",
      :street_address=>"800 Acoma St",
      :zip=>"80204",
      :country=>"US",
      :distance=>0.31422}
    station = Station.new(attrs)
    expect(station).to be_a Station
    expect(station.name).to eq("UDR")
    expect(station.address).to eq("800 Acoma St Denver, CO")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.distance).to eq(0.31422)
    expect(station.access_times).to eq("24 hours daily")
  end

end
