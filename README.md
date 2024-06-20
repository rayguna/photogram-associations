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
