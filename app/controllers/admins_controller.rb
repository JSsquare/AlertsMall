class AdminsController < ApplicationController
  before_filter :authenticate_user!

 def hit_impressions
   Impression.destroy_all() if params[:commit].present? and params[:commit] == "CLEAR ALL"
   @unique_impression_count = Impression.count('session_hash', :distinct => true)
   @impressions = Impression.order('created_at DESC').page(params[:page])
 end

  def blocked_users
    @blocked_list = BlockedUsers.paginate(:page => params[:page],:per_page => 10)
  end

  def block
    if params[:tweetid_to_remove].present?
      Tweet.find(params[:tweetid_to_remove]).destroy
    end

    if params[:tableid_to_unblock].present?
      BlockedUsers.find(params[:tableid_to_unblock]).destroy
    else
      params[:username] = params[:username].strip
      @blocked_users = BlockedUsers.new(params)
      respond_to do |format|
        if params[:username].present? and params[:provider].present?
          if @blocked_users.save
            format.html { redirect_to banned_path }
          else
            format.html { redirect_to banned_path, alert: "Could not add to block list. Inform Johnny!!" }
          end
        else
          format.html { redirect_to banned_path, alert: "Username/Provider not entered" }
        end
      end
    end
  end

end