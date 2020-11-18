# frozen_string_literal: true

class StaffMember < ApplicationRecord
  include EmailHolder
  include PersonalNameHolder

  has_many :events, class_name: 'StaffEvent', dependent: :destroy

  validates :start_date, presence: true, date: {
    after_or_equal_to: Date.new(2000, 1, 1),
    before: ->(_obj) { 1.year.from_now.to_date },
    allow_blank: true
  }
  validates :end_date, date: {
    after: :start_date,
    before: ->(_obj) { 1.year.from_now.to_date },
    allow_blank: true
  }

  def password=(raw_password)
    if raw_password.is_a?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_date <= Date.today && (end_date.nil? || end_date > Date.today)
  end
end
