class AdminsController < ApplicationController
  before_filter :authenticate_user!

 def hit_impressions
   @unique_impression_count = Impression.count('session_hash', :distinct => true)
   @impressions = Impression.paginate(:page => params[:page],:per_page => 10)

 end

end