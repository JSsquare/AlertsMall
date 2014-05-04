class TweetsController < ApplicationController

  before_filter :authenticate_user!, :only => [:index]
  impressionist actions: [:new]
  def index
    @tweets = Tweet.paginate(:page => params[:page],:per_page => 10)
    respond_to do |format|
      format.html
      format.xml { render :xml => @tweet }
    end
  end

  def new
    session.clear if params["not_johndoe"]
    @username = session[:username]
    @tweet = Tweet.new
  end

  def create
    session[:username] = tweet_params["username"].present? ?  tweet_params["username"] : false
    if request.env['omniauth.auth'].present? or session[:username].present?
      params[:tweet][:provider] = 'twitter'
      params[:tweet][:johndoe] = false
      params[:tweet][:username] = session[:username] || request.env['omniauth.auth']['info']['nickname']
      session[:auth_hash] =  request.env['omniauth.auth']
    end

    validate_tweet_body params[:tweet][:body]

    publish_tweet(tweet_params) if want_to_publish?
    @tweet = Tweet.new(params[:tweet])
    respond_to do |format|
      if @tweet.save
        UserMailer.delay.someone_tweeted(@tweet.id)
        format.html { redirect_to new_tweet_path, notice: 'You just tweeted for AlertsMall' }
        format.json { render action: 'tweets/new', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end

  def validate_tweet_body tweet_params


  end

  def want_to_publish?
    if params[:tweet][:username].present? and params[:tweet][:johndoe] == false
      params[:tweet][:posted] = true
      return true
    else
      return false
    end
  end

  def tweet_params
    params.require(:tweet).permit(:body, :username)
  end

  def publish_tweet(tweet_params)
    @via_mention = tweet_params["username"] == 'JohnDoe' ? 'via www.afoodie.me' : "via(@#{tweet_params["username"]})"
    @post_content = "#{tweet_params["body"]} #{@via_mention}"
    CLIENT.update(@post_content)
  end


  def admin_approve
    tweetid_to_pubish = params["tweet"]["tweet_id"].to_i
    @tweet_details_to_publish = Tweet.find(tweetid_to_pubish)

    if @tweet_details_to_publish.update(posted: true)
      publish_tweet(@tweet_details_to_publish )
    end

  end


end









#FOR PUNE FOOD ALERTS
#consumer_key = "jJm5FqTl3GJrRueIXIXOTA"
#consumer_key_secret = "KJneLltuLLV4foKNin8SxHLcXPTDnVyvBBf9cZ2I"

#access_token = "2209559442-Lm6L4QbrcTQvl7MbGKR5YAvoefp6vxO1fTlHvAz"
#access_token_secret = "KZ5OMcCS7n2k2a07m5rQcsLJjpEjj6bZ5hZEpySvavMHF"
