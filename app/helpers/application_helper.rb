# frozen_string_literal: true

module ApplicationHelper
  include HtmlBuilder

  def document_title
    if @title.present?
      "#{@title} - Baukis2"
    else
      'Baukis2'
    end
  end
end
