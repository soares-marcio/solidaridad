require 'rails_helper'

RSpec.describe UsersHasCategory, type: :model do
  before do
    @users_has_category = create(:users_has_category)
  end
  it "belong_to category" do
    expect(@users_has_category).to belong_to(:category)
  end  
  it "belong_to user" do
    expect(@users_has_category).to belong_to(:user)
  end    
end
