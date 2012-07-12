class Lend < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :friend_id, :friend_name, :item, :user_id
end
