class BulkUploadsController < ApplicationController
    layout "layout"
   # before_filter :login_required
    
  def upload_file

      #params[:page] condition is added due to jump to # feature
      if request.post? and params[:page].blank?
        @products_array,session[:local_file_path]=Product.parse_csv(params[:file],current_user,true)
      end
      @products_array,session[:local_file_path]=Product.parse_csv(session[:local_file_path],current_user,false) if !params[:page].blank? && !session[:local_file_path].blank?
      if  !@products_array.blank?
      paginated_products =  WillPaginate::Collection.new(params[:page].blank? ? 1 : params[:page].to_i,1)
      paginated_products.replace @products_array[paginated_products.offset,paginated_products.per_page]
      paginated_products.total_entries =@products_array.size
      @products=paginated_products
      end
  end
end
