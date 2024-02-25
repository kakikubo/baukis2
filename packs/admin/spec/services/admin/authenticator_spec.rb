# frozen_string_literal: true

require 'rails_helper'

describe Admin::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      m = build(:administrator)
      expect(described_class.new(m).authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:administrator)
      expect(described_class.new(m).authenticate('xy')).to be_falsey
    end

    example 'パスワード未設定ならfalseを返す' do
      m = build(:administrator)
      expect(described_class.new(m).authenticate(nil)).to be_falsey
    end
  end
end
