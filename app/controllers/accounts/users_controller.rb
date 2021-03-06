# frozen_string_literal: true

module Accounts
  # This is what we use to list the current users on a given account
  # as well as providing the functionality if an account owner
  # wishes to remove another user from the account.
  class UsersController < Accounts::BaseController
    before_action :authorize_owner!

    def index; end

    def destroy
      user = User.find(params[:id])
      current_account.users.delete(user)
      flash[:notice] = "#{user.email} has been removed from this account."
      redirect_to users_path
    end
  end
end
