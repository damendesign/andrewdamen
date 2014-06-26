class InvitationMailer < ActionMailer::Base
  default from: "motherplant@420friend.ly"

  def registration_confirmation(invitation)
    @invitation = invitation
    if Rails.env.production?
      mail to: @invitation.email, subject: "Thanks for registering!"
    else
      mail to: "motherplant@420friend.ly", subject: "TEST: Thanks for registering!"
    end
  end
end
