class Lend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  has_many :reminders, dependent: :destroy
  
  validates_presence_of :friend_name, message: 'cant be blank', :if => Proc.new { |a| a.friend_id.blank? }
  validates_presence_of :friend_id, message: 'cant be blank', :if => Proc.new { |a| a.friend_name.blank? }
  
  attr_accessor :use_text
  attr_accessible :friend_id, :friend_name, :item, :use_text
  
  def use_text
    !friend_id && !self.new_record?
  end
  
  
end
