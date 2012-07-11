class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :friends, :through => :friendships
  has_many :friendships
  
  scope :without, lambda { |id| where('id not in (?)', id) }
  
  
  def self_and_friends
    list = self.friends.collect(&:id)
    list << self.id
  end
  
  def to_s
    email
  end
  
end
