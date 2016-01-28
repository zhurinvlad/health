class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable,
           :omniauthable

  validates :weight,:rating,:growth, allow_blank: true, numericality: true

  include DeviseTokenAuth::Concerns::User

   def email=(address)
    if new_record?
      write_attribute(:email, address)
    else
      errors.add(:email, "Изменение Email невозможно!")
      false
    end
  end 

end
