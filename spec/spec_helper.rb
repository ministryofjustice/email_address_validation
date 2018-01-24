# frozen_string_literal: true

require 'simplecov-rcov'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.minimum_coverage 98.77

SimpleCov.start

require 'bundler/setup'
require 'active_support/all'
require 'email_address_validation'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
