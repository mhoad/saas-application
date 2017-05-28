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

FactoryGirl.define do
  factory :invitation do
    email 'user@example.com'
    account
  end
end
