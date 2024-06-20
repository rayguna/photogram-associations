# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  validates(:poster, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Photo#poster: returns a row from the users table associated to this photo by the owner_id column

  # Photo#comments: returns rows from the comments table associated to this photo by the photo_id column

  # Photo#likes: returns rows from the likes table associated to this photo by the photo_id column

  ## Indirect associations

  # Photo#fans: returns rows from the users table associated to this photo through its likes

  # def poster
  #   my_owner_id = self.owner_id

  #   matching_users = User.where({ :id => my_owner_id })

  #   the_user = matching_users.at(0)

  #   return the_user
  # end

  #many_to-one
  belongs_to(:poster, class_name:"User", foreign_key:"owner_id")
  

  # def comments
  #   my_id = self.id

  #   matching_comments = Comment.where({ :photo_id => self.id })

  #   return matching_comments
  # end

  #one-to-many relationships  
  has_many(:comments, foreign_key:"photo_id")

  # def likes
  #   my_id = self.id

  #   matching_likes = Like.where({ :photo_id => self.id })

  #   return matching_likes
  # end

  #one-to-many relationships  
  has_many(:likes, class_name:"Like", foreign_key:"photo_id")

  def fans
    my_likes = self.likes
    
    array_of_user_ids = Array.new

    my_likes.each do |a_like|
      array_of_user_ids.push(a_like.fan_id)
    end

    matching_users = User.where({ :id => array_of_user_ids })

    return matching_users
  end

  def fan_list
    my_fans = self.fans

    array_of_usernames = Array.new

    my_fans.each do |a_user|
      array_of_usernames.push(a_user.username)
    end

    formatted_usernames = array_of_usernames.to_sentence

    return formatted_usernames
  end
end
