# frozen_string_literal: true

class StaffMember < ApplicationRecord
  include StringNormalizer

  has_many :events, class_name: 'StaffEvent', dependent: :destroy

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/.freeze

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name  = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
  end

  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
                                                 format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :start_date, presence: true, date: {
      after_or_equal_to: Date.new(2000, 1, 1),
      before: -> (obj) { 1.year.from_now.to_date },
      allow_blank: true
  }
  validates :end_date, date: {
      after: :start_date,
      before: -> (obj) { 1.year.from_now.to_date },
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
