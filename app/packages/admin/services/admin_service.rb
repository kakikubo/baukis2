# frozen_string_literal: true

module AdminService
  def self.configure(staff_member)
    @staff_member = staff_member
    freeze
  end

  def self.staff_member
    @staff_member
  end
end
