class TweetsController < ApplicationController

  before_filter :authenticate_user!, :only => [:index]
  impressionist actions: [:new]
  helper_method :critiquking_reckoner

  def index
    @tweets = Tweet.page(params[:page]).order('created_at DESC')
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


  def stitch_split_reviews splitreview
    opinion = splitreview['liked_dish'] == "true" ? "Liked" : "Disliked"
    unless splitreview['review_dishname'].empty? and splitreview['review_placename'].empty?
     stitched_review = "#{opinion} #{splitreview['review_dishname'].titleize} at #{splitreview['review_placename'].titleize}, ##{splitreview['city']}. #{splitreview['review_thoughts']}"
    else
      stitched_review = ""
    end

    return stitched_review
  end

  def create
    foodcops_message = rand(2) == 1 ? "Keep watching our <a href='https://twitter.com/PuneFoodAlerts' target='_blank'>feeds</a>. Thanks!" : "Sign-in & Post-Review To Join the <a href='/admins/user_scores' target='_blank'>LEADERBOARD</a>"
    params[:tweet][:body] = stitch_split_reviews params[:splitreview]
    session[:username] = tweet_params["username"].present? ?  tweet_params["username"] : false

    # WHEN JohnDoe is false
    if request.env['omniauth.auth'].present? or session[:username].present?
      params[:tweet][:provider] = 'twitter'
      params[:tweet][:johndoe] = false
      params[:tweet][:username] = session[:username] || request.env['omniauth.auth']['info']['nickname']
      session[:auth_hash] =  request.env['omniauth.auth']
    else
      params[:tweet][:username] = 'JohnDoe'
    end

    @post_content = formulate_post_content tweet_params["username"], tweet_params["body"]

    want_to_publish? #This is for assigning :posted field to true or false

    @tweet = Tweet.new(params[:tweet])
    respond_to do |format|
      if blocked_user? tweet_params["username"]
        format.html { redirect_to new_tweet_path , alert: "<b><u>YOU ARE BLOCKED ASSHOLE!!</u></b><br/>Contact me to know the reason." }
      else
        unless  validate_tweet_body? @post_content
         format.html { redirect_to new_tweet_path , alert: "<b>IM SORRY!! YOUR PLATE IS FULL</b><br/>Keep your review short & sweet" }
        else
          unless validate_username_count? tweet_params["username"]
            format.html { redirect_to new_tweet_path , alert: "<b><u>SORRY!! NO 2nd HELPING</u></b><br/>Please review as 'Anonymous' or come back tomorrow" }
        else
          if @tweet.save
            UserMailer.delay.someone_tweeted(@tweet.id)
            publish_tweet @post_content if want_to_publish?
            flash_message_after_review = want_to_publish? ? "<b><u>BULLSEYE!!</u></b><br/>Your review has been posted to the <a href='https://twitter.com/PuneFoodAlerts' target='_blank'>Feeds</a>. <br/> Hope you've already Liked our pages. Thank you" : "<b><u>FOOD COP @ WORK!!</u></b> <br/> Your review is being supervised. Please wait for approval<br/> #{foodcops_message} "
            format.html { redirect_to new_tweet_path, notice: "#{flash_message_after_review}" }
            format.json { render action: 'tweets/new', status: :created, location: @tweet }
          else
            format.html { redirect_to new_tweet_path , alert: "<b><u>YOUR PLATE LOOKS EMPTY!!</u></b><br/>Have you specified the Dish or Restaurant name?" }
          end
         end
        end
        end
    end

  end

  def formulate_post_content username, post_body
    @length_of_via_text = 6 #via(@)
    @skeleton_length = post_body.length + username.length + @length_of_via_text

    case @skeleton_length
      when (133..140)
        @post_script = username == 'JohnDoe' ? '(via www.aFoodie.Me)' : "via(@#{username})"
      when (100..133)
        @post_script = username == 'JohnDoe' ? '(via www.aFoodie.Me)' : "via(#aFoodieMe @#{username})"
      when (0..100)
        @post_script = username == 'JohnDoe' ? '(via www.aFoodie.Me)' : "via(@#{username}) #EveryoneIsAFoodie"
    end

    return @post_content_formulated = "#{post_body} #{@post_script}"
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

  def publish_tweet post_content
    CLIENT.update(post_content)
  end


  def admin_approve
    tweet_id_to_pubish = params["tweet"]["tweet_id"].to_i
    @tweet_details_to_publish = Tweet.find(tweet_id_to_pubish)

    if @tweet_details_to_publish.update(posted: true)
      publish_tweet formulate_post_content @tweet_details_to_publish.username, @tweet_details_to_publish.body
    end
  end

  def connect_users
    params[:connecting][:mobilenumber] = false
    @connected_user = ConnectedUserinfo.new(params[:connecting])
    UserMailer.delay.connecting_users(params[:connecting][:info])
    if @connected_user.save
      render nothing: true
    else
      render nothing: true
    end
  end

  def destroy
    redirect_to new_tweet_path, :flash => { :success => "Destroyed!!" }
  end

  def critiquking_reckoner
    if params[:badge_earned].present?
      UsersScore.update_all(:critiquking => false)
      ck = UsersScore.find_by_username(session[:username])
      ck.critiquking = true
      ck.save
      render nothing: true
    end
    $TOPSCORE_WALL = 2
    if request.env['omniauth.auth'].present? or session[:username].present?
     session[:username] = request.env['omniauth.auth'].present? ? request.env['omniauth.auth']['info']['nickname'] : session[:username]
     @current_user_score = UsersScore.where(username: session[:username]).limit(1).pluck(:score)
     @current_top_score = UsersScore.where("provider <> 'JohnDoe' and critiquking = true").maximum(:score)

     if @current_user_score.present? and @current_top_score.present?
       if @current_user_score[0] > $TOPSCORE_WALL and @current_user_score[0] > @current_top_score and not UsersScore.where(username: session[:username]).exists?(:critiquking => true)
          true
       else
         @current_user_score[0] == @current_top_score + 1 ? true : false
       end
     elsif @current_user_score.present? and @current_user_score[0] == $TOPSCORE_WALL + 1
        true
     else
       false
     end
    else
      false
    end

  end




#VALIDATION METHODS CAN BE SHIFTED TO MODEL. LEARN HOW

  def blocked_user? username
    @blocked_user_records = BlockedUsers.all
    @blocked_usernames = @blocked_user_records.pluck(:username)
    return @blocked_usernames.any?{ |s| s.casecmp(username)==0 }
  end


  def validate_tweet_body? post_content
    if post_content.length > 140
      false
    else
      true
    end
  end

  def validate_username_count? username
    if username == 'JohnDoe'
      true
    else
      if Tweet.where("created_at >= ? AND username='#{username}'", Time.zone.now.beginning_of_day).present?
        false
      else
        true
      end
    end
  end


end









#FOR PUNE FOOD ALERTS
#consumer_key = "jJm5FqTl3GJrRueIXIXOTA"
#consumer_key_secret = "KJneLltuLLV4foKNin8SxHLcXPTDnVyvBBf9cZ2I"

#access_token = "2209559442-Lm6L4QbrcTQvl7MbGKR5YAvoefp6vxO1fTlHvAz"
#access_token_secret = "KZ5OMcCS7n2k2a07m5rQcsLJjpEjj6bZ5hZEpySvavMHF"
