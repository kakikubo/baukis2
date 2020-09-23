Rails.application.configure do
  config.exceptions_app = lambda { |env|
    request = ActionDispatch::Request.new(env)

    action =
      case request.path_info
      when '/404' then :not_found
      when '/422' then :unprocessable_entity
      else; :internal_server_error
      end

    ErrorController.action(action).call(env)
  }
end
