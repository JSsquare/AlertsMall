class UserMailer < ActionMailer::Base
  default from: '"#EveryoneIsAFoodie" alertsmall.email@gmail.com'

  def someone_tweeted tweet_id
    @tweet = Tweet.find(tweet_id)
    mail(to: 'jnypklms.buffer@gmail.com', subject: "#{@tweet.username} Tweeted on #{@tweet.created_at}")
  end

  def connecting_users user_mailid
   attachments.inline['twittericon.png'] = File.read("#{Rails.root}/app/assets/images/twittera.png")
    mail(to: user_mailid, bcc: 'jnypklms.buffer@gmail.com', subject: "Burrrrrp!!!")
  end

end
