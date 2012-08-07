class Reminder < ActiveRecord::Base
  attr_accessible :due_in, :lend_id
  
  belongs_to :lend
  
  validates :due_in, :lend_id, presence: true
end
