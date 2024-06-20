# photogram-associations

Target: https://photogram-gui.matchthetarget.com/

Lesson: https://learn.firstdraft.com/lessons/157-photogram-associations

Grading: https://grades.firstdraft.com/resources/efa93d83-1750-48e4-9f09-a7c32e9a2c0f

<hr>

Notes

1. All work are done within:

```
All of the work for this project will be done in the model files:

app/models/comment.rb

app/models/follow_request.rb

app/models/like.rb

app/models/photo.rb

app/models/user.rb
```

2. Quick review:

- has_many(:method_name, class_name: "ClassName", foreign_key: "foreignkey_id"): one-to-many relationship
- belongs_to(:method_name, class_name: "ClassName", foreign_key: "foreignkey_id"): many-to-one relationship
- has_many(:filmography, through: :characters, source: :movie): one-to-many relationships. each character is associated with many instances of movies.

Here is the equivalent method for has_many(:filmography, ...)

```
class Actor < ApplicationRecord
  # def filmography
  #   the_many = Array.new

  #   self.characters.each do |joining_record|
  #     destination_record = joining_record.movie

  #     the_many.push(destination_record)
  #   end

  #   return the_many
  # end

  #iterate through each character and join to movie.
  has_many(:filmography,through: :characters, source: :movie)
end
```

Here is the explanation:
- One actor has many characters.
- Associate each character with the corresponding movie. 
- The above command allows you to locate the movie the actor has acted.

*** 

3. Start by populating tables using the command `rake sample_data`.

4. grade the assignment with `rake grade`.

5. Refer to the figure provided in the lesson to understand the table relationships.

6. Go to app/models/*.rb files and create the shorthand commands to complete this assignment.

7. **Beware of aliases!** In the assignment, the foreign keys have been renamed, which makes it tricky. USe the original foreign key id in the one-liner commands to get it right.

8. Here is an example of has_many() one-liner, Note the syntax.

- One photo has many likes
```
#class Photo

  # def likes
  #   my_id = self.id

  #   matching_likes = Like.where({ :photo_id => self.id })

  #   return matching_likes
  # end

  #one-to-many relationships  
  has_many(:likes, class_name:"Like", foreign_key:"photo_id")
```

9. Here is an example of belongs_to() one-liner, Note the syntax.

- One photo has many posters
```
#class Photo

  # def poster
  #   my_owner_id = self.owner_id

  #   matching_users = User.where({ :id => my_owner_id })

  #   the_user = matching_users.at(0)

  #   return the_user
  # end

  #many_to-one
  belongs_to(:poster, class_name:"User", foreign_key:"owner_id")
```

10. An example of using though and source.

```
  # def fans
  #   my_likes = self.likes
    
  #   array_of_user_ids = Array.new

  #   my_likes.each do |a_like|
  #     array_of_user_ids.push(a_like.fan_id)
  #   end

  #   matching_users = User.where({ :id => array_of_user_ids })

  #   return matching_users
  # end

  #many-to-many
  has_many(:fans, through: :likes, source: :fan)
```

Another similar example

```
  # def liked_photos
  #   my_likes = self.likes
    
  #   array_of_photo_ids = Array.new

  #   my_likes.each do |a_like|
  #     array_of_photo_ids.push(a_like.photo_id)
  #   end

  #   matching_photos = Photo.where({ :id => array_of_photo_ids })

  #   return matching_photos
  # end

  #many-to-many
  has_many(:liked_photos, through: :likes, source: :photo)
```
