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

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let(:invitation) { FactoryGirl.create(:invitation) }

  it 'generates a unique token' do
    expect(invitation.token).to be_present
  end
end
