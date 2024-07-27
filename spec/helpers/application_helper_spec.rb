# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#document_title' do
    context 'when @title is present' do
      it "returns the page title with the base title 'Baukis2'" do
        # @titleが提供されている場合のテスト
        assign(:title, 'Specific Page')
        expect(helper.document_title).to eq 'Specific Page - Baukis2'
      end
    end

    context 'when @title is nil' do
      it "returns only the base title 'Baukis2'" do
        # @titleがnilまたは空である場合のテスト
        assign(:title, nil)
        expect(helper.document_title).to eq 'Baukis2'
      end
    end

    context 'when @title is an empty string' do
      it "returns only the base title 'Baukis2'" do
        # @titleが空の文字列である場合のテスト
        assign(:title, '')
        expect(helper.document_title).to eq 'Baukis2'
      end
    end
  end
end
