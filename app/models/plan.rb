# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :integer
#  stripe_id  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ApplicationRecord
end
