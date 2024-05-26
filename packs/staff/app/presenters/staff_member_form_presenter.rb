# frozen_string_literal: true

class StaffMemberFormPresenter < UserFormPresenter
  def password_field_block(name, label_text, options = nil)
    super if object.new_record?
  end

  def suspended_check_box
    markup(:div, class: 'check-boxes') do |m|
      m << check_box(:suspended)
      m << label(:suspended, 'アカウント停止')
    end
  end
end
