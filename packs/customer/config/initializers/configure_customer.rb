# frozen_string_literal: true

Rails.application.config.to_prepare do
  StaffService.configure(Customer, Address)
end
