class AttachmentsController < ApplicationController

  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def ng_upload
    @attachment = Attachment.create params.permit(:file, :attachable_type, :attachable_id)
    render json: @attachment
  end

  def ng_delete
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    head :no_content
  end

end
