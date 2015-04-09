require 'rubygems'
require 'factory_girl'
#require 'database_cleaner'

#require_relative '../lib/radventure'
require_relative '../lib/radventure/world'
require_relative '../lib/radventure/game'
require_relative '../lib/radventure/room'
require_relative '../lib/radventure/thing'
require_relative '../lib/radventure/player'
require_relative '../lib/radventure/container'
require_relative '../lib/radventure/activity'
require_relative '../lib/radventure/sentence'
require_relative '../lib/radventure/output'
#require_relative '../lib/ex47/game'
#require_relative '../spec/factories/lists.rb'
#require_relative '../spec/factories/nodes.rb'
#require_relative '../spec/factories/rooms.rb'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
#  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
#  config.use_transactional_fixtures = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
  config.before(:suite) do
    begin
  # if using database, ensure that the linting doesn't change state
#      DatabaseCleaner.start
#      FactoryGirl.lint
#    ensure
#      DatabaseCleaner.clean
    end
  end
end
