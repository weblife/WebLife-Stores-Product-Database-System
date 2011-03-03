class AddIdFiledInCompscrapper < ActiveRecord::Migration
  def self.up
    add_column :compscrapers, :compscrapper_id, :string
  end

  def self.down
    remove_column :compscrapers, :compscrapper_id
  end
end
