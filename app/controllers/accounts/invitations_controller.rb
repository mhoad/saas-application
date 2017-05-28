# frozen_string_literal: true

module Accounts
  class InvitationsController < Accounts::BaseController
    before_action :authorize_owner!

    def new
      @invitation = Invitation.new
    end

    def create
      @invitation = current_account.invitations.new(invitation_params)
      @invitation.save
      InvitationEmailJob.perform_later(@invitation.id)
      flash[:notice] = "#{@invitation.email} has been invited."
      redirect_to root_url
    end

    private

    def authorize_owner!
      return if owner?
      flash[:alert] = 'Only the account owner can do that.'
      redirect_to root_url(subdomain: current_account.subdomain)
    end

    def invitation_params
      params.require(:invitation).permit(:email)
    end
  end
end
