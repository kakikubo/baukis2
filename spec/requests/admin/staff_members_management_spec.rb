require 'rails_helper'

describe "管理者による職員管理" do
  let(:administrator) { create(:administrator) }

  describe "新規登録" do
    let(:params_hash) { attributes_for(:staff_member) }

    example "職員一覧ページにリダイレクト" do
      post admin_staff_members_url, params: { staff_member: params_hash }
      expect(response).to redirect_to(admin_staff_members_url)
    end

    example "例外 ActionController::ParameterMissing が発生" do
      expect { post admin_staff_members_url }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "更新" do
    let(:staff_member) { create(:staff_member) }
    let(:params_hash) { attributes_for(:staff_member) }
  end
end