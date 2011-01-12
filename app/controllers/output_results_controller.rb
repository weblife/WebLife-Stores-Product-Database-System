class OutputResultsController < ApplicationController
    layout "layout"
  def output
    @product=Product.find :first
    if request.post?
      @results=Product.search_products(params[:search][:search_field],params[:search_text])
    end
  end

  def export_csv
      
      file_path=ExportCsv.export_csv(params[:search],params[:searched_field],params[:searched_text])
      send_file(file_path , :type => 'text/csv')
  end
end
