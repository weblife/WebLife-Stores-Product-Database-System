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
      @product.update_attributes(params[:product])
      @product.inset.update_attributes(params[:inset])
      @product.property.update_attributes(params[:property])
      @product.text_anchor.update_attributes(params[:text_anchor])
      @product.url_link.update_attributes(params[:url_link])


    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "success_msg","Product is successfully updated."
        end
      }
    end
    
  end
end
