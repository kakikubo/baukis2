# frozen_string_literal: true

class Staff::TopController < Staff::Base
  skip_before_action :authorize

  def index
    # raise IpAddressRejected
    # raise Forbidden
    # raise ActiveRecord::RecordNotFound
    if current_staff_member
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end
end