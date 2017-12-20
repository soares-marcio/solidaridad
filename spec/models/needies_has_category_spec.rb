require 'rails_helper'

RSpec.describe NeediesHasCategory, type: :model do
  before do
    @needies_has_category = create(:needies_has_category)
  end
  it "belong_to category" do
    expect(@needies_has_category).to belong_to(:category)
  end  
  it "belong_to needy" do
    expect(@needies_has_category).to belong_to(:needy)
  end  
end
