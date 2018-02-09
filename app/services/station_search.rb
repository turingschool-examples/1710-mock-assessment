class StationSearch
  def initialize(zip)
    @zip = zip
  end

  def stations
    NrelService.new(zip).find_stations[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :zip
end
