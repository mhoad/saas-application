# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  subdomain  :string
#

# Accounts are the same as customers. While a single account
# could have many users within it, they are still only a
# single customer
class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      sign_in(@account.owner)
      flash[:notice] = 'Your account has been created.'
      redirect_to root_url(subdomain: @account.subdomain)
    else
      flash.now[:alert] = 'Sorry, your account could not be created.'
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :subdomain,
                                    owner_attributes: %i[
                                      email password password_confirmation
                                    ])
  end
end
