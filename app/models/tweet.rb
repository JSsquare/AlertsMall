class Tweet < ActiveRecord::Base
  is_impressionable
  validates :body, :presence => true
  attr_accessible :body, :provider, :johndoe, :posted, :username
end