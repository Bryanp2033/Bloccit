require 'rails_helper'

describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create!(name: 'name_example', description: 'This is a description') # default is public
       @private_topic = Topic.create!(name: 'name_example', description: 'This is a description', public: false)
     end
 
     describe "publicly_available" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_available).to eq( [@public_topic] )
       end
     end
 
     describe "privately_available" do
       it "returns a relation of all private topics" do
         expect(Topic.privately_available).to eq( [@private_topic])
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = User.new
         user = true
         expect(Topic.visible_to(user)).to eq(Topic.all)
       end
 
       it "returns only public topics if user is nil" do
         expect(Topic.visible_to(nil)).to eq(Topic.publicly_available)
       end
     end
   end
 end