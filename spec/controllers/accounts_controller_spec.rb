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

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
end
