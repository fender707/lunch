# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/factories"
config.infer_base_class_for_anonymous_controllers = false
config.infer_spec_type_from_file_location!
config.order = "random"
config.include AssertDifference
config.include Devise::TestHelpers, type: :controller
 require 'database_cleaner'
  config.before(:suite) do
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:deletion)
end
config.before(:each) do |example|
DatabaseCleaner.strategy = example.metadata[:type] == :feature ? :deletion : :transaction
DatabaseCleaner.start
end
config.after(:each) do
DatabaseCleaner.clean
end

# assertions if you prefer.
config.expect_with :rspec do |expectations|
# This option will default to `true` in RSpec 4. It makes the `description`
# and `failure_message` of custom matchers include text for helper methods
# defined using `chain`, e.g.:
# be_bigger_than(2).and_smaller_than(4).description
# # => "be bigger than 2 and smaller than 4"
# ...rather than:
# # => "be bigger than 2"
expectations.include_chain_clauses_in_custom_matcher_descriptions = true
end
# rspec-mocks config goes here. You can use an alternate test double
# library (such as bogus or mocha) by changing the `mock_with` option here.
config.mock_with :rspec do |mocks|
# Prevents you from mocking or stubbing a method that does not exist on
# a real object. This is generally recommended, and will default to
# `true` in RSpec 4.
mocks.verify_partial_doubles = true
end
  config.infer_spec_type_from_file_location!
end
