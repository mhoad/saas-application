# frozen_string_literal: true

require 'rails_helper'

feature 'Adding widgets' do
  let(:account) { FactoryGirl.create(:account) }

  context 'as the accounts owner' do
    before do
      login_as(account.owner)
      set_subdomain(account.subdomain)
    end

    it 'can add a widget' do
      visit root_url(subdomain: account.subdomain)
      save_and_open_page
      click_link 'Add widget'
      fill_in 'Name', with: 'Widget Test'
      click_button 'Create Widget'
      expect(page).to have_content('Widget was successfully created.')
    end
  end
end
