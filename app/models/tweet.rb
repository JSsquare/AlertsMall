class Tweet < ActiveRecord::Base
  is_impressionable
  validates :body, :presence => true
  attr_accessible :body, :provider, :johndoe, :posted, :username

  after_save :update_users_scores
  #before_destroy :take_away_users_score

  protected
  def update_users_scores
    unless UsersScore.where(username: self.username, posted: self.posted).exists?(conditions = :none)
      his_score = UsersScore.new
      his_score.username = self.username
      his_score.posted = self.posted
      his_score.score = 1
      his_score.provider = self.provider
      his_score.save
    else
      existing_user = UsersScore.find_by(username: self.username, posted: self.posted)
      existing_user.score = existing_user.score + 1
      existing_user.save
    end


  end

end