class FriendshipsController < ApplicationController
  respond_to :html
  
  def index
    @all_users = User.without_self(current_user.id)
    @friends = current_user.friends
  end
  
  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    flash[:notice] = "Friend was successfully added." if @friendship.save

    respond_with(@friendship) do |format|
      format.html { render 'index' }
    end
  end
  
end
