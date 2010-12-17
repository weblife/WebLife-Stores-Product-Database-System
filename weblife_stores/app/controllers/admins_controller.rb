class AdminsController < ApplicationController
  layout "layout"
  #before_filter :login_required
	def users_list
    @users=User.find :all,:conditions=>["is_admin=0"]
	end

end
