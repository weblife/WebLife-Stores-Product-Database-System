class AddOverrideMinimumAcceptableMarkupFieldInProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :override_acceptable_markup, :decimal , :precision=> 8 , :scale=>2
  end

  def self.down
    remove_column :products, :override_acceptable_markup
  end
end
