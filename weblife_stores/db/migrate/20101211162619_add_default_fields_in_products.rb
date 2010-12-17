class AddDefaultFieldsInProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :active_status, :string,:default=>"Active"
    add_column :products, :product_type, :string,:default=>"Non-inventory Part"
    add_column :products, :cogs_account, :string,:default=>"Cost of Goods Sold"
    add_column :products, :account, :string,:default=>"Sales"
    add_column :products, :sales_tax_code, :string,:default=>"Tax"
    add_column :products, :purchased_for_resale, :string,:default=>"y"
    add_column :products, :is_new, :string,:default=>"New"
    add_column :products, :free_ship_method, :integer,:default=>1
    add_column :products, :taxable, :boolean,:default=>true
    add_column :products, :ship_alone, :boolean,:default=>false
    add_column :products, :free_shipping, :boolean,:default=>false
    add_column :products, :po_description_detail, :string,:default=>"NONE"
    add_column :products, :commercial_free_shipping, :boolean,:default=>false
    add_column :products, :streetsign_free_shipping, :boolean,:default=>false
    add_column :products, :streetlights_free_shipping, :boolean,:default=>false
    add_column :products, :addressplaq_free_shipping, :boolean,:default=>false
    add_column :products, :commercial_adjustment, :decimal , :precision=> 8 , :scale=>2,:default=>0
    add_column :products, :streetsign_adjustment, :decimal , :precision=> 8 , :scale=>2,:default=>0
    add_column :products, :streetlights_adjustment, :decimal , :precision=> 8 , :scale=>2,:default=>0
    add_column :products, :addressplaq_adjustment, :decimal , :precision=> 8 , :scale=>2,:default=>0

  end

  def self.down
    remove_column :products, :active_status
    remove_column :products, :product_type
    remove_column :products, :cogs_account
    remove_column :products, :account
    remove_column :products, :sales_tax_code
    remove_column :products, :purchased_for_resale
    remove_column :products, :is_new
    remove_column :products, :free_ship_method
    remove_column :products, :taxable
    remove_column :products, :ship_alone
    remove_column :products, :free_shipping
    remove_column :products, :po_description_detail
    remove_column :products, :commercial_free_shipping
    remove_column :products, :streetsign_free_shipping
    remove_column :products, :streetlights_free_shipping
    remove_column :products, :addressplaq_free_shipping
    remove_column :products, :commercial_adjustment
    remove_column :products, :streetsign_adjustment
    remove_column :products, :streetlights_adjustment
    remove_column :products, :addressplaq_adjustment


  end
end
