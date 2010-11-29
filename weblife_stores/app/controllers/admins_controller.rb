class AdminsController < ApplicationController
  layout "layout"
	def users_list
    @users=User.find :all,:conditions=>["is_admin=0"]
	end
end
