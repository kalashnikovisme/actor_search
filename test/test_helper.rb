if ENV["TRAVIS"]
  autoload :Coveralls, 'coveralls'
  Coveralls.wear!
end

autoload :SimpleCoverage, 'simplecov'
ENV["RAILS_ENV"] = "test"
SimpleCov.start('rails') if ENV["COVERAGE"]

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
autoload :FactoryGirl, 'factory_girl'
FactoryGirl.reload

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryGirl::Syntax::Methods
end
