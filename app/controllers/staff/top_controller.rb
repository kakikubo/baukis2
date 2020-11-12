# frozen_string_literal: true

module Staff
  class TopController < Staff::Base
    skip_before_action :authorize

    def index
      # raise IpAddressRejected
      # raise Forbidden
      # raise ActiveRecord::RecordNotFound
      render action: 'index'
    end
  end
end
