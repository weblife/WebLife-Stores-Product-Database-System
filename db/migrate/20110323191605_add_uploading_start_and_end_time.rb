class AddUploadingStartAndEndTime < ActiveRecord::Migration
  def self.up
    rename_column :cached_informations,:latest_products_uploaded_time, :latest_products_uploaded_start_time
    add_column :cached_informations, :latest_products_uploaded_end_time, :datetime

    rename_column :cached_informations,:latest_comp_uploaded_time, :latest_comp_uploaded_start_time
    add_column :cached_informations, :latest_comp_uploaded_end_time, :datetime
    
  end

  def self.down
    rename_column :cached_informations, :latest_products_uploaded_start_time,:latest_products_uploaded_time
    remove_column :cached_informations, :latest_products_uploaded_end_time
    rename_column :cached_informations, :latest_comp_uploaded_start_time,:latest_comp_uploaded_time
    remove_column :cached_informations, :latest_comp_uploaded_end_time
  end
end
