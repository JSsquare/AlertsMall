class TweetsController < ApplicationController

  def new
    session.clear if params["not_johndoe"]

    @username = session[:username]

    if request.env['omniauth.auth'].present?
      auth_hash = request.env['omniauth.auth']
      @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      if @authorization
        render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
      else
        user = User.new :name => auth_hash["info"]["nickname"], :email => "test@test.com"
        user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
        user.save
      end
    end

    @tweet = Tweet.new
  end

  def create
    tweet_post(tweet_params)
    session[:username] = tweet_params["username"].present? ?  tweet_params["username"] : false
    if request.env['omniauth.auth'].present? or session[:username].present?
      params[:tweet][:provider] = 'twitter'
      params[:tweet][:johndoe] = false
      session[:auth_hash] =  request.env['omniauth.auth']
    end
    @tweet = Tweet.new(params[:tweet])
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to new_tweet_path, notice: 'You just tweeted for AlertsMall' }
        format.json { render action: 'tweets/new', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end

  def tweet_post(tweet_params)
    consumer_key = "dSMJ2nkOj87ooiWrQKzTSw"
    consumer_key_secret = "74Q6R7yVM3E0rglcvSbWdzfnYKfSybTlkB8TO4XJY"
    access_token = "2357901931-ybQJGkicqvpIYwbeYpuBu9DJUoVqzTfEVyw83JE"
    access_token_secret = "BsOY7trOw4roXaAkz1emYp2KTzvOVvoeubuODL1MNeLQH"

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_key_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
    post_content = tweet_params["username"].present? ? "#{tweet_params["body"]} via(@#{tweet_params["username"]})" : "#{tweet_params["body"]}"
    client.update(post_content)
  end


  def tweet_params
    params.require(:tweet).permit(:body, :username)
  end


end









#FOR PUNE FOOD ALERTS
#consumer_key = "jJm5FqTl3GJrRueIXIXOTA"
#consumer_key_secret = "KJneLltuLLV4foKNin8SxHLcXPTDnVyvBBf9cZ2I"

#access_token = "2209559442-Lm6L4QbrcTQvl7MbGKR5YAvoefp6vxO1fTlHvAz"
#access_token_secret = "KZ5OMcCS7n2k2a07m5rQcsLJjpEjj6bZ5hZEpySvavMHF"
