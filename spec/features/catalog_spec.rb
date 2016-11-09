require 'rails_helper'
include Warden::Test::Helpers

feature 'Visitor wants to browse and search' do
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

    scenario 'topic facet page has A-Z links' do
      visit facet_catalog_path("topic_sim", :'facet.sort' => 'index')
      expect(page).to have_link('A', href: '/catalog/facet/topic_sim?facet.prefix=A&facet.sort=index' )
      expect(page).to have_link('Z', href: '/catalog/facet/topic_sim?facet.prefix=Z&facet.sort=index' )
    end

    scenario 'creator facet page has A-Z links' do
      visit facet_catalog_path("creator_sim", :'facet.sort' => 'index')
      expect(page).to have_link('A', href: '/catalog/facet/creator_sim?facet.prefix=A&facet.sort=index' )
      expect(page).to have_link('Z', href: '/catalog/facet/creator_sim?facet.prefix=Z&facet.sort=index' )
    end
  end
end