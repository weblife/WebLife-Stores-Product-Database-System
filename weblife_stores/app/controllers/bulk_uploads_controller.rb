class BulkUploadsController < ApplicationController
    layout "layout"

    
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

  def save
      @products_array,session[:local_file_path]=Product.parse_csv(session[:local_file_path],current_user,false)
      page_no=1
      is_error=false
      @products_array.each do |product|
          if !product.valid? && !product.errors.on(:product_id).blank? && product.errors.on(:product_id)!="Id must be uniq."
            is_error=true
            
            break
          end
          page_no+=1
      end
      if (page_no-1)==@products_array.count && !is_error
         @products_array.each do |product|
           product.user_id=current_user.id
           product.save(false)
           page_no=1
         end
      end
      redirect_to :action=>"upload_file",:page=>page_no
  end

  def revert_products
      products=Product.find(:all,:conditions=>["user_id=?",current_user.id],:limit=>params[:id],:order=>"id DESC")
      products.each do |product|
        product.destroy
      end
      
      redirect_to upload_path
  end
end
