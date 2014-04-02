class Tweet < ActiveRecord::Base
  attr_accessible :body, :provider, :johndoe, :posted, :username
end