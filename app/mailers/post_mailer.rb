class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_mail.subject
  #
  def post_mail(user)
    @greeting = "Votre photo a été publiée avec succès"

    mail to: user.email
  end
end
