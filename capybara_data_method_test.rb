require "rubygems"
require "bundler/setup"

require 'sinatra/base'
class SimpleRackApp < Sinatra::Base
  get '/' do
    '<a href="/new-page" data-method="I AM NOT A RAILS 3 APPLICATION">anchor</a>'
  end
  get '/new-page' do
    'new-page'
  end
end

require 'capybara'
require 'capybara/dsl'

Capybara.current_driver = :rack_test
Capybara.app            = SimpleRackApp

require 'test/unit'
class SimpleRackAppTest < Test::Unit::TestCase
  include Capybara
  def test_should_ignore_the_rails_3_specific_use_of_data_method_attribute
    visit      '/'
    click_link 'anchor'
    
    assert_equal '/new-page', current_path
    assert_equal 'new-page', page.body
  end
end