require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe ::Authorities::AgentController, type: :controller do

  let(:user_attributes) do
    { email: 'test2@example.com' }
  end
  let(:user) do
    User.new(user_attributes) { |u| u.save(validate: false) }
  end

  let(:agent) {Agent.create!(label: ['An Agent'])}

  describe '#show' do
    it 'it should load the Agent record' do
      get :show, id: agent
      expect(response).to have_http_status :success
     end
  end

  describe '#create' do
    it 'an anonymous user should not be able to create a new Agent record' do
      post :create, agent: {"label"=>["719a81d6-1392-46f5-8037-184dd612babb"]}
      expect(response).to redirect_to("/users/sign_in")
     end
    it 'a logged-in user should create a new Agent record' do
      sign_in user
      expect{
        post :create, agent: {"label"=>["719a81d6-1392-46f5-8037-184dd612babb"]}
      }.to change(Agent,:count).by(1)
     end
  end

  describe '#update' do
    it 'an anonymous user should not be able to update an Agent record' do
      put :update, id: agent.id,  agent: {"label"=>[agent.id], "id"=>agent.id}
      expect(response).to redirect_to("/users/sign_in")
    end
    it 'a logged-in user should update an Agent record' do
      sign_in user
      put :update, id: agent.id,  agent: {"label"=>[agent.id], "id"=>agent.id}
      expect(response).to redirect_to(authorities_agent_path agent)
     end
  end
end
