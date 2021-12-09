require 'sinatra'
require 'dotenv'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'mongoid'

Dotenv.load
Mongoid.load!(File.join(File.dirname(__FILE__), 'mongoid.yml'))
