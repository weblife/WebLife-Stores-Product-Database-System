class BulkUploadsController < ApplicationController
  def upload_file
      Product.parse_file(params)
  end
end
