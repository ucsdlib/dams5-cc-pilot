require 'rails_helper'
include Warden::Test::Helpers

feature 'Create an Agent' do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test2@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      login_as user
    end

    scenario 'should be able to access the agent form and create agent' do
      visit root_path
      expect(page).to have_link 'New Agent'

      click_link 'New Agent'
      expect(page).to have_selector 'h1', text: 'Create New Agent'

      fill_in 'agent_label', with: 'Test New Agent'
      click_button 'Create Agent'
      expect(page).to have_content 'Test New Agent'
    end

    scenario 'should be able to create agent that links a closeMatch URL' do
      visit new_authorities_agent_path

      expect(page).to have_selector 'h1', text: 'Create New Agent'

      fill_in 'agent_label', with: 'Test New Agent with Close Match'
      fill_in 'agent_close_match', with: 'http://test.com/a/link/to/closeMatch'
      click_button 'Create Agent'
      expect(page).to have_content 'Test New Agent with Close Match'
      expect(page).to have_link 'http://test.com/a/link/to/closeMatch'
    end

    scenario 'should be able to edit agent ' do
      visit new_authorities_agent_path

      expect(page).to have_selector 'h1', text: 'Create New Agent'

      fill_in 'agent_label', with: 'Test Edit Agent'
      click_button 'Create Agent'
      expect(page).to have_content 'Test Edit Agent'
      click_link 'Edit'
      fill_in 'agent_label', with: 'Test Edit Agent Updated'
      click_button 'Save Agent'
      expect(page).to have_content 'Test Edit Agent Updated'
    end
  end
end