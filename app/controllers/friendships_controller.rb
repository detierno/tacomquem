class FriendshipsController < ApplicationController
  respond_to :html
  
  def index
    @all_users = User.without(current_user.self_and_friends)
    @friends = current_user.friends
    
  end
  
  def create
    already_friend = !current_user.friendships.where(friend_id: params[:friend_id]).empty?
    logger.info already_friend
    if already_friend
      flash[:notice] = "Friend already added."
    else
      @friendship = current_user.friendships.new(friend_id: params[:friend_id])
      flash[:notice] = "Friend was successfully added." if @friendship.save
    end

    respond_with(@friendship) do |format|
      format.html { redirect_to friendships_path }
    end
  end
  
  def destroy  
    @friendship = current_user.friendships.find_by_friend_id(params[:id])  
    @friendship.destroy 
    flash[:notice] = "Friendship cancelled."
     
    redirect_to friendships_url
  end
  
end
