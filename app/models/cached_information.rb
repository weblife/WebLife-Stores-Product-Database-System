class CachedInformation < ActiveRecord::Base
  #There are couple of reasons for this model
  #1- user can revert only last upload, so need to track that information
  #2- If you upload file but not save and then logged in again after few days so this information should remain on screen

  belongs_to :user

  def set_product_reverted
      self.is_product_info_reverted=true
      self.save
  end

  def back_product_reverted
      self.is_product_info_reverted=false
      self.save
  end

  def set_product_cached_file(path)
      self.products_cached_path=path
      self.save
  end

  def set_product_cached_file_null
      self.update_attribute(:products_cached_path,nil)
  end
  def set_products_uploaded_time
      self.update_attribute(:latest_products_uploaded_time,Time.now.utc)
  end
  def set_compscraper_uploaded_time
      self.update_attribute(:latest_comp_uploaded_time,Time.now.utc)
  end

  def set_compscraper_reverted
      self.is_compscrapper_info_reverted=true
      self.save
  end

  def back_compscraper_reverted
      self.is_compscrapper_info_reverted=false
      self.save
  end

  def set_compscraper_cached_file(path)
      self.compscrapper_cached_path=path
      self.save
  end
  
  def set_compscraper_cached_file_null
      self.compscrapper_cached_path=nil
      self.save
  end

end
