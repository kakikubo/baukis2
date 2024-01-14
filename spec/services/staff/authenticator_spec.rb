# frozen_string_literal: true

require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      m = build(:staff_member)
      expect(described_class.new(m).authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:staff_member)
      expect(described_class.new(m).authenticate('xy')).to be_falsey
    end

    example 'パスワード未設定ならfalseを返す' do
      m = build(:staff_member)
      expect(described_class.new(m).authenticate(nil)).to be_falsey
    end

    example '停止フラグがたっていてもtrueを返す' do
      m = build(:staff_member, suspended: true)
      expect(described_class.new(m).authenticate('pw')).to be_truthy
    end

    example '開始前ならfalseを返す' do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(described_class.new(m).authenticate('pw')).to be_falsey
    end

    example '終了後ならfalseを返す' do
      m = build(:staff_member, end_date: Time.zone.today)
      expect(described_class.new(m).authenticate('pw')).to be_falsey
    end
  end
end
