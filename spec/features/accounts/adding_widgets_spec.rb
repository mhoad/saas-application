# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Adding widgets', type: :feature do
  let(:account) { FactoryGirl.create(:account) }

  context 'as the accounts owner' do
    before do
      login_as(account.owner)
      set_subdomain(account.subdomain)
    end

    it 'can add a widget' do
      visit root_url
      click_link 'Add widget'
      fill_in 'Name', with: 'Widget Test'
      click_button 'Create Widget'
      expect(page).to have_content('Widget was successfully created.')
    end
  end
end
