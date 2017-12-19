require 'rails_helper'

RSpec.describe UsersHasNeedy, type: :model do
  before do
    @users_has_needy = create(:users_has_needy)
  end
  it "belong_to user" do
    expect(@users_has_needy).to belong_to(:user)
  end  
  it "belong_to needy" do
    expect(@users_has_needy).to belong_to(:user)
  end   
end
