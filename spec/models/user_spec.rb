require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) {User.create!(email: "elepage@bowdoin.edu", password: "password")}

  describe "attributes" do
    it "responds to role" do
       expect(my_user).to respond_to(:role)
     end

     it "responds to standard?" do
       expect(my_user).to respond_to(:standard?)
     end

     it "responds to admin?" do
       expect(my_user).to respond_to(:admin?)
     end

     it "responds to premium?" do
       expect(my_user).to respond_to(:premium?)
     end

  end

  describe "roles" do

     it "is standard by default" do
       expect(my_user.role).to eql("standard")
     end
  end

end
