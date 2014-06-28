# can't use require_relative yet as base path hasn't been set
require File.join(File.dirname(__FILE__), 'app', 'app')

require 'rubygems'
require 'bundler'
Bundler.require

run Sinatra::Application