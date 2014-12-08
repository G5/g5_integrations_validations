require "pry"
require "g5_integrations_validations"
require "shoulda/matchers"
require "bundler/setup"
Bundler.require(:defaults, :development)

SPEC_DIR = File.expand_path(__dir__)
Dir[File.join(SPEC_DIR, "fixtures", "*.rb")].each {|f| require f}
