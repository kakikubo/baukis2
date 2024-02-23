# frozen_string_literal: true

module Staff
  class LoginForm
    include ActiveModel::Model

    attr_accessor :email, :password
  end
end
