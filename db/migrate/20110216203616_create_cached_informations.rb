class CreateCachedInformations < ActiveRecord::Migration
  def self.up
    create_table :cached_informations do |t|
      t.integer :user_id
      t.boolean :is_product_info_reverted,:default=>false
      t.string :products_cached_path
      t.boolean :is_compscrapper_info_reverted,:default=>false
      t.string :compscrapper_cached_path
      t.timestamps
    end
    users=User.find :all
    users.each do |user|
       CachedInformation.create(:user_id=>user.id)
    end
  end

  def self.down
    drop_table :cached_informations
  end
end
