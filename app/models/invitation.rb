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
class Invitation < ApplicationRecord
  belongs_to :account
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
