require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.create(username: "James", email: "james@peaches.com", password: "thatsabigpeach") }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#is_password?' do
    it 'should verify the user\'s password' do
      expect(user.is_password?('thatsabigpeach')).to be true
      expect(user.is_password?('Thatsabigpeach')).to be false
    end
  end

  describe '#reset_session_token!' do
    it 'should change the user\'s session token' do
      s1 = user.session_token
      user.reset_session_token!
      s2 = user.session_token
      expect(s1).to_not eq(s2)
    end
  end

  describe '::find_by_credentials' do
    it 'should return the user that matches the credentials given' do
      User.create(username: "Arnold", email: "arnold@shows.com", password: "footballhead")
      # Find by email
      expect(User.find_by_credentials('arnold@shows.com','footballhead')).to be_a(User)
      # Find by username
      expect(User.find_by_credentials('Arnold','footballhead')).to be_a(User)
    end

    it 'should return nil if no user is found' do
      expect(User.find_by_credentials('asdf','asdf')).to eq(nil)
    end
  end
end
