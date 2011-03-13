class RemoveInvalidCompscraperData < ActiveRecord::Migration
  def self.up
      add_column :compscrapers, :product_id, :integer
      remove_column :compscrapers, :compscrapper_id
      Compscraper.delete_all
      products=Product.find :all
      products.each do |prod|
        comp=Compscraper.new
        comp.product_id=prod.id
        comp.user_id=prod.user_id
        comp.save(false)
      end

  end

  def self.down
    remove_column :compscrapers, :product_id
    add_column :compscrapers, :compscrapper_id, :integer
  end
end
