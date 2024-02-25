# frozen_string_literal: true

module Admin
  class StaffEventsController < Admin::Base
    def index
      @events = AdminService
                .events(staff_member_id: params[:staff_member_id])
                .order(occurred_at: :desc).includes(:member).page(params[:page])
    end
  end
end
