class UserMailer < ActionMailer::Base
  default from: "alertsmall.email@gmail.com"

  def someone_tweeted(tweet_id)
    @tweet = Tweet.find(tweet_id)
    mail(to: 'jnypklms.buffer@gmail.com', subject: "#{@tweet.username} Tweeted on #{@tweet.created_at}")
  end

end
