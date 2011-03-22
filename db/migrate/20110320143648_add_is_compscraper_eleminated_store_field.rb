class AddIsCompscraperEleminatedStoreField < ActiveRecord::Migration
  def self.up
    add_column :stores, :is_compscraper_related, :boolean,:default=>false
    add_column :products, :suggested_retail_price_override, :decimal , :precision=> 8 , :scale=>2
    
    usr=User.find(:first,:conditions=>["is_admin=?",true])
    Store.create(:user_id=>usr.id,:name=>"Budgetmailboxes.com",:store_url=>"",:store_type=>"",:is_active=>true,:is_compscraper_related=>true)
    Store.create(:user_id=>usr.id,:name=>"Budgetcommercial.com",:store_url=>"",:store_type=>"",:is_active=>true,:is_compscraper_related=>true)
    Store.create(:user_id=>usr.id,:name=>"Budgetstreetsigns.com",:store_url=>"",:store_type=>"",:is_active=>true,:is_compscraper_related=>true)
    Store.create(:user_id=>usr.id,:name=>"Budgetstreetlights.com",:store_url=>"",:store_type=>"",:is_active=>true,:is_compscraper_related=>true)
    Store.create(:user_id=>usr.id,:name=>"Budgetaddressplaues.com",:store_url=>"",:store_type=>"",:is_active=>true,:is_compscraper_related=>true)
  end

  def self.down
    remove_column :stores, :is_compscraper_related
    remove_column :products, :suggested_retail_price_override
  end
end
