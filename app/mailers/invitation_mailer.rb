# frozen_string_literal: true

# This is for when an account owner wishes to invite another user
# to join their account.
class InvitationMailer < ApplicationMailer
  def invite(invitation)
    @invitation = invitation
    mail(
      to: invitation.email,
      subject: "Invitation to join #{invitation.account_name} on Reporting.Social",
      content_type: 'multipart/alternative'
    )
  end
end
