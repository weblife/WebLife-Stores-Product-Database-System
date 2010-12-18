class AddingNewFieldsInProducts < ActiveRecord::Migration
  def self.up
    add_column :products,:price_override,:decimal,:precision=>8,:scale=>2,:default=>0
  end

  def self.down
    remove_column :products,:price_override
  end
end
