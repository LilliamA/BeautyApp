class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
      attachments.inline['logo.png'] = File.read("#{Rails.root}/app/assets/images/logo.jpg")
    mail(to: @user.email, subject: 'Welcome to Beauty App')
  end
end
