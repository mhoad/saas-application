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
# This class represents an account on the platform. Accounts
# can contain many different users but all have a single
# owner which is also a User class.
#
class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
  validates :subdomain, presence: true, uniqueness: true
  validates :name, presence: true
end
