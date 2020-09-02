# frozen_string_literal: true

class Staff::TopController < Staff::Base
  def index
    # raise IpAddressRejected
    # raise Forbidden
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end
end
