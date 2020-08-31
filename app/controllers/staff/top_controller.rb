# frozen_string_literal: true

class Staff::TopController < ApplicationController
  def index
    # raise IpAddressRejected
    # raise Forbidden
    raise ActiveRecord::RecordNotFound
    render action: "index"
  end
end
