# frozen_string_literal: true

# This is an ActiveJob class using DelayedJob that sends users
# an email when they have been invited to join a particular account
class InvitationEmailJob < ApplicationJob
  queue_as :user_invites

  def perform(invitation_id)
    invitation = Invitation.find(invitation_id)
    InvitationMailer.invite(invitation).deliver_now
  end
end
