class AddIndices < ActiveRecord::Migration
  def up
  	change_table :links do |t|
  		t.index :url
  		t.index :short_url
  	end
  end

  def down
  end
end
