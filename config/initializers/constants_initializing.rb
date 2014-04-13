CONSUMER_KEY = "dSMJ2nkOj87ooiWrQKzTSw"
CONSUMER_KEY_SECRET = "74Q6R7yVM3E0rglcvSbWdzfnYKfSybTlkB8TO4XJY"
ACCESS_TOKEN = "2357901931-ybQJGkicqvpIYwbeYpuBu9DJUoVqzTfEVyw83JE"
ACCESS_TOKEN_SECRET = "BsOY7trOw4roXaAkz1emYp2KTzvOVvoeubuODL1MNeLQH"

CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_KEY_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end