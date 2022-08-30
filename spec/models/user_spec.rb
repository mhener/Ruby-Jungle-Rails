require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it 'should create a new user' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password:'pa$$w0rd',
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.valid?).to be true
      expect(@user.errors.full_messages).to be_empty
    end

    it '(the password and password confirmation) should match' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password:'pa$$w0rd',
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'should return an invalid user when there is no password' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password: nil,
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.password).to be nil
      expect(@user.valid?).to be false
    end

    it 'should return an invalid user when there is no password confirmation' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password:'pa$$w0rd',
        password_confirmation: nil,
      )

      expect(@user.password_confirmation).to be nil
      expect(@user.valid?).to be false
    end

    it 'should return an invalid user when first name is empty' do
      @user = User.new(
        first_name: nil,
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password:'pa$$w0rd',
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.first_name).to be_nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should return an invalid user when last name is empty' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: nil,
        email: 'tayler@swift.com',
        password:'pa$$w0rd',
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.last_name).to be_nil
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end

    it 'should return an invalid user when email is empty' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: nil,
        password:'pa$$w0rd',
        password_confirmation: 'pa$$w0rd',
      )

      expect(@user.email).to be nil
      expect(@user.valid?).to be false
    end

    it 'email should be unique' do
      user = User.new
      user.first_name = 'first_name'
      user.last_name = 'last_name'
      user.email = 'test@test.com'
      user.password = 'password'
      user.password_confirmation = 'password'
      user.save

      user2 = User.new
      user2.first_name = 'first_name'
      user2.last_name = 'last_name'
      user2.email = 'test@test.com'
      user2.password = 'password'
      user2.password_confirmation = 'password'
      user2.save

      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'email should not be case sensitive' do
      user = User.new
      user.first_name = 'first_name'
      user.last_name = 'last_name'
      user.email = 'test@test.com'
      user.password = 'password'
      user.password_confirmation = 'password'
      user.save

      user2 = User.new
      user2.first_name = 'first_name'
      user2.last_name = 'last_name'
      user2.email = 'TEST@TEST.COM'
      user2.password = 'password'
      user2.password_confirmation = 'password'
      user2.save

      expect(user2.errors[:email]).to include("has already been taken")
    end

    it 'password should be at least 8 characters long' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password: 'bad',
        password_confirmation: 'bad',
      )

      expect(@user.valid?).to be false
    end

    it 'password is valid when 8 characters long' do
      @user = User.new(
        first_name: 'Tayler',
        last_name: 'Swift',
        email: 'tayler@swift.com',
        password: '12345678',
        password_confirmation: '12345678',
      )

      expect(@user.valid?).to be true
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should pass when valid credentials are passed into User.new()' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', '12345678')
      expect(user).not_to be(nil)
    end

    it 'should authenticate user when email has spaces before and after' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('  test@test.com  ', '12345678')
      expect(user).not_to be(nil)
    end

    it 'should authenticate user when email has upper case letters' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      user.save

      user = User.authenticate_with_credentials('TEST@TEST.COM', '12345678')
      expect(user).not_to be(nil)
    end
  end
end
