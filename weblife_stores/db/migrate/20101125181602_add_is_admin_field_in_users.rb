class AddIsAdminFieldInUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :is_admin, :boolean,:default=>false
	User.create(:login=>"admin",:email=>"admin@weblife.com",:password=>"weblifeadmin",:password_confirmation=>"weblifeadmin",:is_admin=>true,:status=>"active",:name=>"admin")
  end

  def self.down
	remove_column :users, :is_admin
	user=User.find(:first,:conditions=>["email=?","admin@weblife.com"])
	user.destroy
  end
end
