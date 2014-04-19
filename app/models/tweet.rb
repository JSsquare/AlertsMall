class Tweet < ActiveRecord::Base
  is_impressionable
  attr_accessible :body, :provider, :johndoe, :posted, :username
end