class ErrorsController < ApplicationController
  layout "staff"

  def not_found
    render_status: 404
  end

  def unprocessable_entity
    render_status: 422
  end

  def internal_server_error
    render_status: 500
  end
end
