require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.new(email: "user@example.com", password: "foobar20", password_confirmation: "foobar20") }

  subject { @user }

  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:email) }
end
