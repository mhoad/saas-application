# frozen_string_literal: true

# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#

FactoryGirl.define do
  factory :widget do
    name { Faker::Company.catch_phrase }
  end
end
