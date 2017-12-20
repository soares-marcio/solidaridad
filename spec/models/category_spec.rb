require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = create(:category)
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

  it "has many needies" do
    expect(@category).to have_many(:needies)
  end

end
