require 'rails_helper'

feature '職員による顧客管理' do
  include FeaturesSpecHelper
  let(:staff_member) { create(:staff_member) }
  let!(:customer) { create(:customer) }

  before do
    switch_namespace(:staff)
    login_as_staff_member(staff_member)
  end

  scenario '職員が顧客、自宅住所、勤務先を更新する' do
    click_link '顧客管理'
    first('table.listing').click_link '編集'

    fill_in 'メールアドレス', with: 'test@example.jp'
    within('fieldset#home-address-fields') do
      fill_in '郵便番号', with: '9999999'
    end
    within('fieldset#work-address-fields') do
      fill_in '会社名', with: 'テスト'
    end
    click_button '登録'

    customer.reload
    expect(customer.email).to eq('test@example.jp')
    expect(customer.home_address.postal_code).to eq('9999999')
    expect(customer.work_address.company_name).to eq('テスト')
  end
end