Rails.application.configure do
  config.baukis2 = {
    staff: { host: 'baukis2.lvh.me', path: '' },
    admin: { host: 'baukis2.lvh.me', path: 'admin' },
    customer: { host: 'lvh.me', path: 'mypage' }
  }
end
