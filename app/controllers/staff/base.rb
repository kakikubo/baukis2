class Staff::Base < ApplicationController
  before_action :authorize

  private def current_staff_member
    @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id]) if session[:staff_member_id]
  end

  helper_method :current_staff_member

  private def authorize
    unless current_staff_member
      flash.alert = '職員としてログインしてください'
      redirect_to :staff_login
    end
  end
end
