class Friendship < ActiveRecord::Base
  attr_accessible :friend_id
  
  belongs_to :friend, :class_name => "User"
  
  before_destroy :write_friends_name  
  
  def write_friends_name
    all_lends = Lend.where(user_id: self.user_id, friend_id: self.friend_id)
    friend = User.find(self.friend_id)
    all_lends.each { |lend| lend.update_attributes(friend_id: nil, friend_name: friend.email) }
  end
  
end
