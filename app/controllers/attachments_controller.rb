class AttachmentsController < ApplicationController
# truncated for brevity.
  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.save
  end
end
