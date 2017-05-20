require 'bundler/setup'
Bundler.setup

require 'st_icml'

RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods
  config.mock_with :rspec
end

