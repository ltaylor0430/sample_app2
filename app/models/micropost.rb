# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }

  default_scope order: 'microposts.created_at DESC'

  #Return microposts from the user being followed by the given user
  def self.from_users_followed_by(user)
 #comment out to move lookup to db
 # 	followed_user_ids = user.followed_user_ids
  followed_user_ids = "SELECT followed_id FROM relationships
  							WHERE follower_id = :user_id"
  	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
  		followed_user_ids: followed_user_ids, user_id: user)  	
  end
end
