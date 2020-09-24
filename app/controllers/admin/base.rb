class Admin::Base < ApplicationController
  before_action :authorize

  private def current_administrator
    @current_administrator ||= Administrator.find_by(id: session[:administrator_id]) if session[:administrator_id]
  end

  helper_method :current_administrator

  private def authorize
    unless current_administrator
      flash.notice = "管理者としてログインしてください"
      redirect_to :admin_login
    end
  end

end
