class BulkUploadsController < ApplicationController
    layout "layout"
    before_filter :login_required
    
  def upload_file
      if request.post?
        @products_array=Product.parse_csv(params[:file],current_user)
        paginated_products =  WillPaginate::Collection.new(params[:page].blank? ? 1 : params[:page].to_i,1)
        paginated_products.replace(@products_array)
        paginated_products.total_entries =@products_array.size
        @products=paginated_products
      end
  end
end
