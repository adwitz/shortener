# Put your database migration here!
#
# Each one needs to be named correctly:
# timestamp_[action]_[class]
#
# and once a migration is run, a new one must
# be created with a later timestamp.

class CreateLinks < ActiveRecord::Migration
    
  def change# PUT MIGRATION CODE HERE TO SETUP DATABASE
	  create_table :links do |t|
	    t.string :url
	    t.string :short_url
    end
	end

  def self.up
  end

  def self.down
  end

end