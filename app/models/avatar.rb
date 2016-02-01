class Avatar < ActiveRecord::Base
   has_one :user, :dependent => :nullify
end
