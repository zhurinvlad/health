class UserMailer < ActionMailer::Base
  default :from => "vlad032grax@gmail.com"
  
  def sucsess_registration(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Password Reset Notification')
  end

end