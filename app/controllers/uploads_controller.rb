class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)
    @upload.save
    url =  @upload.asset.url(:original)
    render json: {:link => "http://#{request.host_with_port}#{url}"}
  end


  def destroy
    temp_name = params[:src].split('/')[-1]
    file_name = temp_name.split('?')[0]
    puts file_name
    @upload = Upload.find_by(:asset_file_name => file_name)
    @upload.destroy
    render json:{:result => "success"}
  end

  private
    def upload_params
      params.permit(:asset)
    end
end
