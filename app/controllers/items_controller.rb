class ItemsController < ApplicationController
   layout "layout"
  def search_items
      if request.post?
        @results=Product.search_products(params[:search][:search_field],params[:search_text])
      end
  end

  def edit
    @product=Product.find(params[:id])
    @inset=@product.inset
    @url_link=@product.url_link
    @text_anchor=@product.text_anchor
    @property=@product.property

    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "individual_item",:partial=>"edit_individual_item"
          page << "scrollToDiv('success_msg_top')"
        end
      }
    end
  end

  def update
      @product=Product.find params[:id]
      @product.attributes=(params[:product])
      @product.save(false)
      @product.inset.attributes=(params[:inset])
      @product.inset.save(false)
      @product.property.attributes=(params[:property])
      @product.property.save(false)
      @product.text_anchor.attributes=(params[:text_anchor])
      @product.text_anchor.save(false)
      @product.url_link.attributes=(params[:url_link])
      @product.url_link.save(false)

    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "success_msg_top","<p style='color:red'><b>Product is successfully updated.</b></p>"
          page << "scrollToDiv('success_msg_top')"
        end
      }
    end
    
  end
end
