require 'rubygems'
require 'activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'scraper.db',
)
