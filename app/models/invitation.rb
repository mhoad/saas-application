# frozen_string_literal: true

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  email      :string
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#
# Note: Using delegation here as per the advice contained in this tip
# https://rails-bestpractices.com/posts/2010/07/24/the-law-of-demeter/
class Invitation < ApplicationRecord
  belongs_to :account
  delegate :name, :subdomain, to: :account, prefix: true

  before_create :generate_token
  validates :email, presence: true

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
