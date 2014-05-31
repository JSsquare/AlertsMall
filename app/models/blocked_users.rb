class BlockedUsers < ActiveRecord::Base
  attr_accessible :provider, :username, :reason
end
