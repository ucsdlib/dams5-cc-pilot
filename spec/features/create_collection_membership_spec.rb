require 'rails_helper'
include Warden::Test::Helpers

feature 'Create a new Object Resource' do
  context 'a logged in user' do
    let(:user) { FactoryGirl.create(:user) }    

    before do
      login_as user
      col = Collection.new title: ['Test Collection']
      col.apply_depositor_metadata user.user_key
      col.save!
    end

    scenario 'should create object with collection membership' do
      visit new_curation_concerns_object_resource_path
      fill_in 'Title', with: 'Test Object'
      fill_in 'Description', with: 'Test Description'
      select 'Test Collection', from: 'object_resource[member_of_collection_ids][]'      
      click_button 'Create Object resource'
      expect(page).to have_content 'Test Object'
      expect(page).to have_content 'Test Description'
      within '.member_of_collections' do
        expect(page).to have_link 'Test Collection'
      end      
    end 
  end
end