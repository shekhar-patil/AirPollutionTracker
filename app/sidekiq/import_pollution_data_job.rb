class ImportPollutionDataJob
  include Sidekiq::Job

  def perform(*args)
    PollutionEtlService.new().run_etl_process
  end
end
