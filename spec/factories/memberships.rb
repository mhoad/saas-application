# frozen_string_literal: true

# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  account_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :membership do
    account nil
    user nil
  end
end
