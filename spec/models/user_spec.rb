require 'spec_helper'

describe User do

  describe ".create_with_omniauth" do

    let(:auth) { OmniAuth.config.mock_auth[:github] }

    it 'initializes new users from github' do
      user = User.create_with_omniauth(auth)
      expect(user).to be_persisted
      expect(user.provider).to eq(auth["provider"])
      expect(user.uid).to eq(auth["uid"])
      expect(user.name).to eq(auth["info"]["name"])
    end

  end

end
