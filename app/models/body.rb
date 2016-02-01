class Body < ActiveRecord::Base
  has_many :avatars, :dependent => :nullify
end
