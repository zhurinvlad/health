class Avatar < ActiveRecord::Base
   has_one :user, :dependent => :nullify
   belongs_to :body
   belongs_to :head
end
