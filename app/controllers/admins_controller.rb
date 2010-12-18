class AdminsController < ApplicationController
  layout "layout"
  #before_filter :login_required
	def users_list
    @users=User.find :all,:conditions=>["is_admin=0"]
	end
  def meta_data
      @meta_data=HardCodeInformation.find :first
      if request.post?
         @meta_data.update_attributes(params[:meta_data])
      end
  end
end
