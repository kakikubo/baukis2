# frozen_string_literal: true

class Administrator < ApplicationRecord
  include EmailHolder
  include PasswordHolder
end
