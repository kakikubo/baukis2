# frozen_string_literal: true

module Admin
  class Base < ApplicationController
    before_action :authorize, :check_account, :check_timeout

    helper_method :current_administrator

    TIMEOUT = 60.minutes

    private

    def current_administrator
      return unless session[:administrator_id]

      @current_administrator ||= Administrator.find_by(id: session[:administrator_id])
    end

    def authorize
      return if current_administrator

      flash.notice = '管理者としてログインしてください'
      redirect_to :admin_login
    end

    def check_account
      return unless current_administrator&.suspended?

      session.delete(:administrator_id)
      flash.alert = 'アカウントが無効になりました'
      redirect_to :admin_root
    end

    def check_timeout
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
