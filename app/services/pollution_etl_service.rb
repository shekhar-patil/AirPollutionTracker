class PollutionEtlService < DataEtlService
  def initialize(data_source = 'OpenWeatherService', options = {})
    super
  end

  def run_etl_process
    run_pollution_etl_process(PollutionDatum)
  end
end
