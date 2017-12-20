require 'rails_helper'

RSpec.describe Needy, type: :model do
  before do
    @needy = create(:needy)
  end
  it "valid " do
    expect(@needy).to be_valid
  end
  it "invalid " do
    @needy.address = nil
    expect(@needy).to be_invalid
  end

  it "have many categories" do
    expect(@needy).to have_many(:categories)
  end
  it "have many users" do
    expect(@needy).to have_many(:users)
  end  
end
