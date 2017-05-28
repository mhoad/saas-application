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

FactoryGirl.define do
  factory :account do
    name { Faker::Company.name }
    subdomain { Faker::Internet.domain_word }
    association :owner, factory: :user
  end
end
