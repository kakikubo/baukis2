# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaffMember do
  describe '#password=' do
    example '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
      member = described_class.new
      member.password = 'baukis'
      expect(member.hashed_password).to be_a(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example 'nilを与えると、hashed_passwordはnilになる' do
      member = described_class.new(hashed_password: 'x')
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end

  describe '値の正規化' do
    example 'email前後の空白を除去' do
      member = create(:staff_member, email: ' test@example.com ')
      expect(member.email).to eq('test@example.com')
    end

    example 'emailに含まれる全角英数字記号を半角に変換' do
      member = create(:staff_member, email: 'ｔｅｓｔ＠ｅｘａｍｐｌｅ．ｃｏｍ')
      expect(member.email).to eq('test@example.com')
    end

    example 'emailに前後の全角スペースを除去' do
      member = create(:staff_member, email: "\u{3000}test@example.com\u{3000}")
      expect(member.email).to eq('test@example.com')
    end

    example 'family_name_kanaに含まれるひらがなをカタカナに変換' do
      member = create(:staff_member, family_name_kana: 'てすと')
      expect(member.family_name_kana).to eq('テスト')
    end

    example 'family_name_kanaに含まれる半角カナを全角カナに変換' do
      member = create(:staff_member, family_name_kana: 'ﾃｽﾄ')
      expect(member.family_name_kana).to eq('テスト')
    end
  end

  describe 'バリデーション' do
    example '@を2個含むemailは無効' do
      member = build(:staff_member, email: 'test@@example.com')
      expect(member).not_to be_valid
    end

    example 'アルファベット表記の family_name は有効' do
      member = build(:staff_member, family_name: 'Smith')
      expect(member).to be_valid
    end

    example '姓に対して漢字、ひらがな、カタカナ、アルファベット以外の文字列は無効' do
      member = build(:staff_member, family_name: '試験@')
      expect(member).not_to be_valid
    end

    example '漢字を含むfamily_name_kanaは無効' do
      member = build(:staff_member, family_name_kana: '試験')
      expect(member).not_to be_valid
    end

    example '長音符(ー)を含むfamily_name_kanaは無効' do
      member = build(:staff_member, family_name_kana: 'エリー')
      expect(member).to be_valid
    end

    example '他の職員のメールアドレスと重複したemailは無効' do
      member1 = create(:staff_member)
      member2 = build(:staff_member, email: member1.email)
      expect(member2).not_to be_valid
    end
  end

  describe '#active?' do
    example '停止フラグがセットされていない場合はtrueを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today - 1)
      expect(member).to be_active
    end

    example '停止フラグがセットされている場合はfalseを返す' do
      member = build(:staff_member, suspended: true, start_date: Time.zone.today - 1)
      expect(member).not_to be_active
    end

    example '開始日が未来の日付の場合はfalseを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today + 1)
      expect(member).not_to be_active
    end

    example '開始日が今日の場合はtrueを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today)
      expect(member).to be_active
    end

    example '終了日が過去の日付の場合はfalseを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today - 5, end_date: Time.zone.today - 1)
      expect(member).not_to be_active
    end

    example '終了日が今日の場合はtrueを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today - 5, end_date: Time.zone.today)
      expect(member).to be_active
    end

    example '終了日が未来の日付の場合はtrueを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today - 5, end_date: Time.zone.today + 1)
      expect(member).to be_active
    end

    example '終了日が設定されていない場合はtrueを返す' do
      member = build(:staff_member, suspended: false, start_date: Time.zone.today - 5, end_date: nil)
      expect(member).to be_active
    end
  end
end
