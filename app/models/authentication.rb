class Authentication < ActiveRecord::Base
  attr_accessible :account_id, :provider, :uid
end
