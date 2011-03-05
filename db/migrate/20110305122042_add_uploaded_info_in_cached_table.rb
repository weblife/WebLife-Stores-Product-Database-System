class AddUploadedInfoInCachedTable < ActiveRecord::Migration
  def self.up
      add_column :cached_informations, :latest_products_uploaded_time, :datetime
      add_column :cached_informations, :latest_comp_uploaded_time, :datetime
  end

  def self.down
      remove_column :cached_informations, :latest_products_uploaded_time
      remove_column :cached_informations, :latest_comp_uploaded_time
  end
end
