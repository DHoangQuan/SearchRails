class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  
  protect_from_forgery unless: -> { request.format.json? }

  private
  def render_error( status, title,message)
    error_hash = {
        errors: [
          status: status,
          title: title,
          detail: message
          
        ]
      }
    render json: error_hash, status: status
  end
  # include JsonapiErrorable
  # rescue_from Exception do |e|
  #   handle_exception(e)
  # end
end
