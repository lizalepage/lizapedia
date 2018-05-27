require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) {User.create!(email: "elepage@bowdoin.edu", password: "password")}
  let(:wiki) {Wiki.create!(title: "New Wiki title", body: "New Wiki Body", private: true, user: user)}

  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: "New Wiki title", body: "New Wiki Body", private: true, user: user)

    end
  end

end
