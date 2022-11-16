require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
  
    it 'creates a user if validations pass' do
      @user = User.new(name: "Me You", email: "me@me.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to_not be_present
    end

    it 'does not create a user if password and password_confirmation do not match' do
      @user = User.new(name: "Me You", email: "me@me.com", password: "5678", password_confirmation: "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'does not create a user without a password' do
      @user = User.new(name: "Me You", email: "me@me.com", password_confirmation: "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'does not create a user without a unique email' do
      @user1 = User.new(name: "Me You", email: "me@me.com", password: "1234", password_confirmation: "1234")
      @user1.save
      @user2 = User.new(name: "You Me", email: "me@me.com", password: "1234",password_confirmation: "1234")
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'does not create a user without an email' do
      @user = User.new(name: "Me You",  password: "1234", password_confirmation: "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not create a user without a name' do
      @user = User.new(email: "me@me.com", password: "1234", password_confirmation: "1234")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
  end

  describe '.authenticate' do

    it 'allows a user to login with correct email and password' do
      @user = User.new(name: "Me You", email: "me@me.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(User.find_by(email: "me@me.com")&.authenticate('1234')).to eq(@user)
    end

    it 'allows a user to type their email with whitespace before and/or after' do
      @user = User.new(name: "Me You", email: "me@me.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(User.find_by(email: "me@me.com".strip)&.authenticate('1234')).to eq(@user)
    end

    it 'allows a user to type their email in the wrong case' do
      @user = User.new(name: "Me You", email: "me@me.com", password: "1234", password_confirmation: "1234")
      @user.save
      expect(User.find_by(email: "Me@Me.cOm".downcase)&.authenticate('1234')).to eq(@user)
    end
  end

end
