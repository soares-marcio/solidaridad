require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end
  it "have many categories" do
    expect(@user).to have_many(:categories)
  end  
  it "has many needies" do
    expect(@user).to have_many(:needies)
  end  
end
