# frozen_string_literal: true

module Admin
  class LoginForm
    include ActiveModel::Model

    attr_accessor :email, :password
  end
end
