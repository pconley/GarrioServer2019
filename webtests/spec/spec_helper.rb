# frozen_string_literal: true

require 'shiken'

def trace(text)
  puts "*** #{text}"
end

def pause(s,text='')
  trace("pausing #{s} seconds #{text}")
  sleep s
end

# add pages to the load path
dir = File.dirname(__FILE__)
# trace "*** add dir = #{dir}"
$LOAD_PATH.unshift("#{dir}/../pages")

# require all the pages in one place
require 'home_page.rb'
require 'login_page.rb'
require 'signup_page.rb'
require 'announcements_page.rb'

RSpec.configure do |config|

  config.before :suite do |x|
    # puts "*** before suite"
    SK::init()
  end

  config.after :suite do |x|
    # puts "*** after suite"
    SK::quit()
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
