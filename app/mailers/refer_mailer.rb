class ReferMailer < ActionMailer::Base

  default from: 'notifications@localhost.com'

  def refer_email(refer)
    @refer = refer

    mail(to: @refer.email, subject: 'Explore GoHuntGeo')
  end
end