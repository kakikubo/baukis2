# spec/presenters/user_form_presenter_spec.rb

require 'rails_helper'

RSpec.describe UserFormPresenter, type: :presenter do
  let(:presenter) { UserFormPresenter.new(form_builder, view_context) }
  let(:form_builder) { instance_double('ActionView::Helpers::FormBuilder') }
  let(:view_context) { instance_double('ActionView::Base') }

  before do
    allow(form_builder).to receive(:label).with(name1, anything, anything).and_return('label_markup')
    allow(form_builder).to receive(:text_field).with(name1, anything).and_return('text_field_markup')
    allow(form_builder).to receive(:text_field).with(name2, anything).and_return('text_field_markup')
    allow(form_builder).to receive(:object).and_return(double('object'))
  end

  describe '#full_name_block' do
    let(:name1) { :first_name }
    let(:name2) { :last_name }
    let(:label_text) { 'Full Name' }
    let(:options) { { class: 'my-class' } }

    it 'returns the full name block with proper HTML structure' do
      allow(presenter).to receive(:decorated_label).with(name1, label_text, options).and_return('label_first_name')
      allow(presenter).to receive(:text_field).with(name1, options).and_return('text_field_first_name')
      allow(presenter).to receive(:text_field).with(name2, options).and_return('text_field_last_name')
      allow(presenter).to receive(:error_messages_for).with(name1).and_return('error_first_name')
      allow(presenter).to receive(:error_messages_for).with(name2).and_return('error_last_name')

      allow(view_context).to receive(:content_tag).and_yield

      result = presenter.full_name_block(name1, name2, label_text, options)

      expected_html = '<div class="input-block">' +
        'label_first_name' +
        'text_field_first_name' +
        'text_field_last_name' +
        'error_first_name' +
        'error_last_name' +
        '</div>'

      expect(result).to eq expected_html
    end
  end
end
