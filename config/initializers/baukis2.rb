# frozen_string_literal: true

Rails.application.configure do
  config.baukis2 = {
    staff: { host: 'baukis2.lvh.me', path: '' },
    admin: { host: 'baukis2.lvh.me', path: 'admin' },
    client: { host: 'lvh.me', path: 'mypage' }
  }
end
