# frozen_string_literal: true

module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
    rescue_from ActionController::ParameterMissing, with: :rescue400
  end

  private def rescue400(_e)
    render 'errors/bad_request', status: :bad_request
  end

  private def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: :forbidden
  end

  private def rescue404(_e)
    render 'errors/not_found', status: :not_found
  end

  private def rescue500(_e)
    render 'errors/internal_server_error', status: :internal_server_error
  end
end
