class ItemsController < ApplicationController
   layout "layout"
   before_filter :validate_user
  def search_items
      if request.post?
        @results=Product.search_products(params[:search][:search_field],params[:search_text])
      end
  end

  def edit
    @product=Product.find(params[:id])
    @product.valid?
    @inset=@product.inset
    @url_link=@product.url_link
    @text_anchor=@product.text_anchor
    @property=@product.property
    @property.valid?
    @compscraper=@product.compscraper

    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "individual_item",:partial=>"edit_individual_item"
          page.replace_html "success_msg_top",""
          page << "scrollToDiv('success_msg_top')"
        end
      }
    end
  end

  def update
      @product=Product.find params[:id]
      @product.attributes=(params[:product])
      @product.valid?
      is_error_exist=false
      @product.errors.each do |field,error|
        if field=="name"
           is_error_exist=true
           break
        end
      end
      @product.save(false) if !is_error_exist
      @product.inset.attributes=(params[:inset])
      @product.inset.save(false) if !is_error_exist
      @product.property.attributes=(params[:property])
      @product.property.valid?
      @product.property.errors.each do |field,error|
        if field=="wholesale_cost"
           is_error_exist=true
           break
        end
      end

      @product.property.save(false) if !is_error_exist
      @product.text_anchor.attributes=(params[:text_anchor])
      @product.text_anchor.save(false) if !is_error_exist
      @product.url_link.attributes=(params[:url_link])
      @product.url_link.save(false) if !is_error_exist
      @compscraper=@product.compscraper
      @compscraper.attributes=params[:compscraper]
      @compscraper.save(false) if !is_error_exist

    respond_to do |format|
      format.js {
        render :update do |page|
         if !is_error_exist
          page.replace_html "success_msg_top","<p style='color:red'><b>Product is successfully updated.</b></p>"
         else
          page.replace_html "success_msg_top","<p style='color:red'><b>Errors:</b></p>"
         end
          #page.replace_html "reference_area",:partial=>"reference_fields",:locals=>{:product=>@product}
          page.replace_html "individual_item",:partial=>"edit_individual_item"
          page << "scrollToDiv('success_msg_top')"
        end
      }
    end
    
  end
end
