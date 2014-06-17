class ConnectedUserinfo < ActiveRecord::Base
  validates :info, uniqueness: true
  attr_accessible :info, :mobilenumber
end
