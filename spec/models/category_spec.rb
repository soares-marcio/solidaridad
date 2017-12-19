require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = create(:category)
    @user = create(:user)
    @users_has_category = 5.times{create(:users_has_category, category: @category)}
  end
  it "valid" do
    expect(@category).to be_valid
  end

  it "invalid" do
    @category.name = nil
    expect(@category).to be_invalid
  end

  it "has many users" do
    expect(@category).to have_many(:users)
  end
end
