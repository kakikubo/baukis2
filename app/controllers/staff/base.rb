# frozen_string_literal: true

module Staff
  class Base < ApplicationController
    before_action :authorize, :check_account, :check_timeout

    private def current_staff_member
      @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id]) if session[:staff_member_id]
    end

    helper_method :current_staff_member

    private def authorize
      return if current_staff_member

      flash.alert = '職員としてログインしてください'
      redirect_to :staff_login
    end

    private def check_account
      return unless current_staff_member && !current_staff_member.active?

      session.delete(:staff_member_id)
      flash.alert = 'アカウントが無効になりました'
      redirect_to :staff_root
    end

    TIMEOUT = 60.minutes

    private def check_timeout
      return unless current_staff_member

      if session[:last_access_time].nil? || session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:staff_member_id)
        flash.alert = 'セッションがタイムアウトしました'
        redirect_to :staff_login
      end
    end
  end
end
