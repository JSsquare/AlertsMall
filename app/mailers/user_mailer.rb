class UserMailer < ActionMailer::Base
  default from: '"#EveryoneIsAFoodie" afoodie.me@gmail.com'

  def someone_tweeted tweet_id
    @tweet = Tweet.find(tweet_id)
    mail(to: 'afoodie.me@gmail.com', subject: "#{@tweet.username} Tweeted on #{@tweet.created_at}")
  end

  def connecting_users user_mailid
   attachments.inline['twittericon.png'] = File.read("#{Rails.root}/app/assets/images/twittera.png")
   attachments.inline['fbicon.png'] = File.read("#{Rails.root}/app/assets/images/facebooka.png")
    mail(to: user_mailid, bcc: 'afoodie.me@gmail.com', subject: "Burrrrrp!!!")
  end

end
