# frozen_string_literal: true

# This class represents an account on the platform. Accounts
# can contain many different users but all have a single
# owner which is also a User class.
class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  accepts_nested_attributes_for :owner
end
