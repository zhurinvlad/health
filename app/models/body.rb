class Body < ActiveRecord::Base
  has_many :avatars, :dependent => :nullify
  mount_uploader :image, AvatarUploader
   def display_name
     id
   end
end
