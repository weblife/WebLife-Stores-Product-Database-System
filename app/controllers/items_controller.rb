class ItemsController < ApplicationController
   layout "layout"
  def search_items
      if request.post?
        @results=Product.search_products(params[:search][:search_field],params[:search_text])
      end
  end

  def edit_item
    @product=Product.find(params[:id])
    @inset=@product.inset
    @url_link=@product.url_link
    @text_anchor=@product.text_anchor
    @property=@product.property

#    if request.post?
#      @product=Product.find params[:id]
#      prod=Hash.new
#      prod=params[:product]
#      prod[:inset_attributes]=params[:inset]
#      prod[:property_attributes]=params[:property]
#      prod[:text_anchor_attributes]=params[:text_anchor]
#      prod[:url_link_attributes]=params[:url_link]
#      @product.update_attributes(prod)
#    end
    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "individual_item",:partial=>"edit_individual_item"
        end
      }
    end
  end

  def update_item
      @product=Product.find params[:id]
      prod=Hash.new
      params[:product][:product_id]=@product.product_id
      prod=params[:product]

      prod[:inset_attributes]=params[:inset]
      prod[:property_attributes]=params[:property]
      prod[:text_anchor_attributes]=params[:text_anchor]
      prod[:url_link_attributes]=params[:url_link]
      @product.attributes=prod
      @product.save(false)

    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "success_msg","Product is successfully updated."
        end
      }
    end
    
  end
end
