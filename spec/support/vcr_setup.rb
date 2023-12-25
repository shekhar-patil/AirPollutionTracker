VCR.configure do |config|
  config.cassette_library_dir = "#{::Rails.root}/spec/cassettes"
  config.hook_into :webmock
end


RSpec.configure do |config|
  config.before(:each) do
    VCR.insert_cassette("#{self.class.metadata[:full_description]}", record: :new_episodes)
  end

  config.after(:each) do
    VCR.eject_cassette
  end
end
