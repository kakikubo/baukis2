# frozen_string_literal: true

module StaffService
  def self.configure(customer, address)
    @customer = customer
    @address = address
    freeze
  end

  def self.customer
    @customer
  end

  def self.address
    @address
  end
end
