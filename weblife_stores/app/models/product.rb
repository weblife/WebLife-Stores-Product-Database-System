require 'csv'
class Product < ActiveRecord::Base
  def self.parse_file(params)
    debugger
    #parsed_file=CSV::Reader.parse(params[:dump][:file])
  end
end
