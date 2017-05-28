# frozen_string_literal: true

module Accounts
  class InvitationsController < Accounts::BaseController
    skip_before_action :authenticate_user!, only: %i[accept accepted]
    before_action :authorize_owner!, except: %i[accept accepted]

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

    def accept
      @invitation = Invitation.find(params[:id])
    end

    def accepted
      @invitation = Invitation.find(params[:id])
      user_params = params[:user].permit(
        :email,
        :password,
        :password_confirmation
      )

      user = User.create(user_params)
      current_account.users << user
      sign_in(user)

      flash[:notice] = "You have joined the #{current_account.name} account."
      redirect_to root_url(subdomain: current_account.subdomain)
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
