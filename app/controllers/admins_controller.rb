class AdminsController < ApplicationController
  layout "layout"
  #before_filter :login_required
  before_filter :validate_user
  before_filter :validate_admin,:except=>[:unintended_url]
	def users_list
    @users=User.find :all,:conditions=>["is_admin=0"]
	end
  def meta_data
      @meta_data=HardCodeInformation.find :first
      if request.post?
         @meta_data.update_attributes(params[:meta_data])
         flash[:notice] = "Date has been successfully saved."
      end
  end
  def unintended_url
    return render :file => "#{RAILS_ROOT}/public/404.html",:status=>404
  end

end
