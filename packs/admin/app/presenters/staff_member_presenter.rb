# frozen_string_literal: true

class StaffMemberPresenter < ModelPresenter
  delegate :suspended?, to: :object

  # 職員の停止フラグの On/Off を表現する記号を返す
  # On: BALLOUT_BOX_WITH_CHECK (U+2611)
  # Off: BALLOUT_BOX (U+2610)
  def suspended_mark
    suspended? ? raw('&#x2611;') : raw('&#x2610;')
  end

  def full_name
    "#{object.family_name} #{object.given_name}"
  end

  def full_name_kana
    "#{object.family_name_kana} #{object.given_name_kana}"
  end
end
