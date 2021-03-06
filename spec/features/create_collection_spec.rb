require 'rails_helper'
include Warden::Test::Helpers

feature 'Create a Collection' do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test2@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      login_as user
      @res_type = ResourceType.create(label: ["Data"], public_uri: ["http://id.loc.gov/vocabulary/resourceTypes/dat"])
      @language = Language.create(label: ["English"], public_uri: ["http://id.loc.gov/vocabulary/iso639-2/eng"])
    end

    scenario 'in is allowed to create collections' do
      visit root_path
      expect(page).to have_link 'Add a Collection'

      click_link 'Add a Collection'
      expect(page).to have_selector 'h1', text: 'Create New Collection'

      fill_in 'collection_title', with: 'Test Collection'
      click_button 'Create Collection'
      expect(page).to have_selector 'h1', text: 'Test Collection'
    end

    scenario 'should see collection specific Brief Description text' do
      visit root_path
      expect(page).to have_link 'Add a Collection'

      click_link 'Add a Collection'
      expect(page).to have_selector 'h1', text: 'Create New Collection'

      fill_in 'collection_title', with: 'Test Collection'
      click_button 'Create Collection'
      expect(page).to have_selector 'h1', text: 'Test Collection'
    end

    scenario 'should see collection customized General Note' do
      visit root_path
      expect(page).to have_link 'Add a Collection'

      click_link 'Add a Collection'
      expect(page).to have_selector 'h1', text: 'Create New Collection'

      fill_in 'collection_title', with: 'Test Collection'
      fill_in 'collection_general_note', with: 'General Note'
      click_button 'Create Collection'
      expect(page).to have_selector 'h1', text: 'Test Collection'
      expect(page).to have_selector 'li.general_note', text: 'General Note'
    end

    scenario 'should create collection with language url' do
      visit root_path
      expect(page).to have_link 'Add a Collection'

      click_link 'Add a Collection'
      expect(page).to have_selector 'h1', text: 'Create New Collection'

      fill_in 'collection_title', with: 'Test Collection - Language'
      select 'English', from: "collection_language"
      click_button 'Create Collection'
      expect(page).to have_selector 'h1', text: 'Test Collection - Language'
      expect(page).to have_selector 'li.language', text: 'English'
    end

    scenario 'should create collection with resource type label from type url' do
      visit root_path
      expect(page).to have_link 'Add a Collection'

      click_link 'Add a Collection'
      expect(page).to have_selector 'h1', text: 'Create New Collection'

      fill_in 'collection_title', with: 'Test Collection - Resource Type'
      select 'Data', from: "collection_resource_type"
      click_button 'Create Collection'
      expect(page).to have_selector 'h1', text: 'Test Collection - Resource Type'
      expect(page).to have_selector 'li.resource_type', text: 'Data'
    end
  end
end