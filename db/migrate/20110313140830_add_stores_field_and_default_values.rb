class AddStoresFieldAndDefaultValues < ActiveRecord::Migration
  def self.up
    add_column :stores, :store_type, :integer
    add_column :stores, :is_active, :boolean,:default=>false
    usr=User.find(:first,:conditions=>["is_admin=?",true])
    Store.create(:user_id=>usr.id,:name=>"BudgetMailboxes.com",:store_url=>"http://www.budgetmailboxes.com/",:store_type=>"1",:is_active=>true)
    Store.create(:user_id=>usr.id,:name=>"BudgetCommercialMailboxes.com",:store_url=>"http://www.budgetcommercialmailboxes.com/",:store_type=>"1",:is_active=>true)
    Store.create(:user_id=>usr.id,:name=>"BudgetAddressPlaque.com",:store_url=>"http://www.budgetaddressplaques.com/",:store_type=>"1",:is_active=>true)
    Store.create(:user_id=>usr.id,:name=>"BudgetStreetSigns.com",:store_url=>"http://www.budgetstreetsigns.com/",:store_type=>"1",:is_active=>true)
    Store.create(:user_id=>usr.id,:name=>"QuickBooks",:store_url=>"",:store_type=>"2",:is_active=>true)
    Store.create(:user_id=>usr.id,:name=>"CompScrapper",:store_url=>"",:store_type=>"2",:is_active=>true)
  end

  def self.down
    remove_column :stores, :store_type
    remove_column :stores, :is_active

  end
end
