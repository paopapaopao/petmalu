class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_approved.subject
  #

  def user_approved
    @user = User.last
    mail(
      to: @user.email,
      subject: 'Petmalu sign up approved'
    )
  end

  def admin_new_user_approval(id)
    @id = id
    mail(
      to: ENV['GMAIL_ADDRESS'],
      subject: 'New user awaiting approval'
    )
  end
end
