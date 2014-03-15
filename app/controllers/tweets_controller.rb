class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{request.env["omniauth.auth"]}"
    if request.env["omniauth.auth"].present?
      auth = request.env["omniauth.auth"]
      @token = auth['credentials']['token']
      @secret = auth['credentials']['secret']
      @handle = auth['info']['name']
    end
    request.env["omniauth.auth"]
    @tweet = Tweet.new(tweet_params)

    tweet_post(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to new_tweet_path, notice: 'You just tweeted for AlertsMall' }
        format.json { render action: 'shops/index', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end

  def tweet_post(tweet_params)
    #FOR PUNE FOOD ALERTS
    #consumer_key = "jJm5FqTl3GJrRueIXIXOTA"
    #consumer_key_secret = "KJneLltuLLV4foKNin8SxHLcXPTDnVyvBBf9cZ2I"

    #access_token = "2209559442-Lm6L4QbrcTQvl7MbGKR5YAvoefp6vxO1fTlHvAz"
    #access_token_secret = "KZ5OMcCS7n2k2a07m5rQcsLJjpEjj6bZ5hZEpySvavMHF"

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
    client.update(tweet_params["body"])


  end


  def tweet_params
    params.require(:tweet).permit(:body)
  end


end
