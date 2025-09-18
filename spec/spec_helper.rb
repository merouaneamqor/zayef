#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'

# Set up SimpleCov for test coverage
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/vendor/'
    minimum_coverage 90
    maximum_coverage_drop 5
  end
end

require 'zayef'

# Configure RSpec
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Enable warnings
  config.warnings = true

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed

  # Configure shared examples
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Configure expectations
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configure mocks
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Allow more verbose output when running an individual spec file
  config.default_formatter = 'doc' if config.files_to_run.one?

  # Print the 10 slowest examples and example groups
  config.profile_examples = 10
end

# Custom matchers
RSpec::Matchers.define :be_a_valid_email do
  match do |actual|
    # Simple email validation - just check for @ symbol and basic structure
    actual.is_a?(String) && actual.include?('@') && actual.split('@').length == 2
  end
end

RSpec::Matchers.define :be_a_moroccan_phone_number do
  match do |actual|
    actual =~ /\A(06|07)\d{8}\z/
  end
end

RSpec::Matchers.define :be_a_valid_cni_number do
  match do |actual|
    actual =~ /\A[A-Z]{2}\d{6}\z/
  end
end

RSpec::Matchers.define :be_a_valid_bank_account do
  match do |actual|
    actual =~ /\AMA\d{18}\z/
  end
end

RSpec::Matchers.define :be_a_valid_postal_code do
  match do |actual|
    actual =~ /\A\d{5}\z/
  end
end
