# frozen_string_literal: true

module StaffService
  def self.configure(customer)
    @customer = customer
    freeze
  end

  def self.customer
    @customer
  end
end
