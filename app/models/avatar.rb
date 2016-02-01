class Avatar < ActiveRecord::Base
   has_one :user, :dependent => :nullify
   belongs_to :profile
   belongs_to :profile
end
