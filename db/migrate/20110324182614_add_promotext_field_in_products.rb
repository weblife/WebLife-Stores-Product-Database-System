class AddPromotextFieldInProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :promo_text, :text
  end

  def self.down
    remove_column :products, :promo_text
  end
end
