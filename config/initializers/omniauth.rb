Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'dSMJ2nkOj87ooiWrQKzTSw', '74Q6R7yVM3E0rglcvSbWdzfnYKfSybTlkB8TO4XJY'
  provider :facebook, '476814989117628', '8456d534b33c435b7545f2ba4d7e708c'
end