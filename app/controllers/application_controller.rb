class ApplicationController < ActionController::Base
  private
  def render_error( status, title,message)
    
    # errors_arr = []
    # byebug
    # resource.errors.each do |e|
      
    #   errors_arr << e
    
    # end
    # byebug
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
