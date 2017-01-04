require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

Rails.backtrace_cleaner.remove_silencers!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'argyle'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
end
