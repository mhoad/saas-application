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
class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner

  validates :subdomain, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :invitations
end
