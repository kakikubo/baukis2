# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'default from' do
    it 'has from@example.com as its default from email' do
      expect(described_class.default_params[:from]).to eq('from@example.com')
    end
  end

  # 以下はApplicationMailerが具体的なメールを持っていた場合のテスト例です。
  # 実際には具体的な子クラスで実装するメールに対してテストを記述します。

  # describe '通知メール' do
  #   let(:mail) { ApplicationMailer.通知メールメソッド }

  #   it 'renders the headers' do
  #     expect(mail.subject).to eq('通知メールのタイトル')
  #     expect(mail.to).to eq(['recipient@example.com'])
  #     expect(mail.from).to eq(['from@example.com'])
  #   end

  #   it 'renders the body' do
  #     expect(mail.body.encoded).to match('メールの本文')
  #   end
  # end
end
