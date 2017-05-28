# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/invitation
class InvitationPreview < ActionMailer::Preview
  def invite
    # user = build(:user, token: 'abc')
    # InvitationMailer.invite(user)
  end
end
