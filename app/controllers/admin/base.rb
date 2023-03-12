# frozen_string_literal: true

module Admin
  class Base < ApplicationController
    before_action :authorize, :check_account, :check_timeout

    private def current_administrator
      @current_administrator ||= Administrator.find_by(id: session[:administrator_id]) if session[:administrator_id]
    end

    helper_method :current_administrator

    private def authorize
      return if current_administrator

      flash.notice = '管理者としてログインしてください'
      redirect_to :admin_login
    end

    private def check_account
      return unless current_administrator && current_administrator.suspended?

      session.delete(:administrator_id)
      flash.alert = 'アカウントが無効になりました'
      redirect_to :admin_root
    end

    TIMEOUT = 60.minutes

    private def check_timeout
      return unless current_administrator

      if session[:admin_last_access_time].nil? || session[:admin_last_access_time] >= TIMEOUT.ago
        session[:admin_last_access_time] = Time.current
      else
        session.delete(:administrator_id)
        flash.alert = 'セッションがタイムアウトしました'
        redirect_to :admin_login
      end
    end
  end
end
