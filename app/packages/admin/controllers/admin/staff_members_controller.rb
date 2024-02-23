# frozen_string_literal: true

module Admin
  class StaffMembersController < Admin::Base
    def index
      @staff_members = AdminService.staff_member.order(:family_name_kana, :given_name_kana).page(params[:page])
    end

    def show
      staff_member = AdminService.staff_member.find(params[:id])
      redirect_to [:edit, :admin, staff_member]
    end

    def new
      @staff_member = AdminService.staff_member.new
    end

    def edit
      @staff_member = AdminService.staff_member.find(params[:id])
    end

    def create
      @staff_member = AdminService.staff_member.new(staff_member_params)
      if @staff_member.save
        flash.notice = '職員アカウントを新規登録しました'
        redirect_to :admin_staff_members
      else
        render action: 'new'
      end
    end

    def update
      @staff_member = AdminService.staff_member.find(params[:id])
      @staff_member.assign_attributes(staff_member_params)
      # @staff_member.attributes = params[:staff_member] # 上と同じ意味です(attributes= はassign_attributesのエイリアス)
      if @staff_member.save
        flash.notice = '職員アカウントを更新しました'
        redirect_to :admin_staff_members
      else
        render action: 'edit'
      end
    end

    def destroy
      staff_member = AdminService.staff_member.find(params[:id])
      staff_member.destroy!
      flash.notice = '職員アカウントを削除しました。'
      redirect_to :admin_staff_members
    end

    private

    def staff_member_params
      params.require(:staff_member).permit(
        :email, :password, :family_name, :given_name,
        :family_name_kana, :given_name_kana,
        :start_date, :end_date, :suspended
      )
    end
  end
end
