class NrelService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    @conn ||= Faraday.new("http://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_stations
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json", default_params.merge({location: zip}))
    JSON.parse(response.body, symbolize_names: true)
  end

  def default_params
    {
      api_key: ENV['NREL_API_KEY'],
      radius: "6.0",
      limit: "10",
      fuel_type: "ELEC,LPG"
    }
  end
end
