class Body < ActiveRecord::Base
  has_many :avatars, :dependent => :nullify
  
   def display_name
     id
   end
end
