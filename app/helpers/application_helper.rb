# frozen_string_literal: true

module ApplicationHelper
  include HtmlBuilder

  def document_title(title)
    title.present? ? "#{title} - Baukis2" : 'Baukis2'
  end
end
