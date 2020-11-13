class StaffMemberPresenter < ModelPresenter
  # 職員の停止フラグの On/Off を表現する記号を返す
  # On: BALLOUT_BOX_WITH_CHECK (U+2611)
  # Off: BALLOUT_BOX (U+2610)
  def suspended_mark
    object.suspended? ? view_context.raw('&#x2611;') : view_context.raw('&#x2610;')
  end
end