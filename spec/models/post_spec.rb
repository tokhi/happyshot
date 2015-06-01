require 'rails_helper'
describe Post, :type => :model  do

	before(:each) do
    	@post = Post.create!(note: "test node", image: "image data here..")
    	@user = User.create!(email: 'tokhi@gmail.com', password: '12345678')
  	end

  context "post creation and validation" do
  	it "post should not be saved without any note and image defined" do
  		post = Post.create
  		expect(post.errors[:note]).to include("can't be blank")
  		expect(post.errors[:image]).to include("can't be blank")
  	end
  end
  context "With two or more comments" do
	  it 'order comments' do
	  	comment1 = @post.comments.create!(comment: 'test comment..', user_id: 1) 
	  	comment2 = @post.comments.create!(comment: 'test comment..', user_id: @user.id)
	  	expect(@post.reload.comments).to eq([comment1, comment2])
	  end
  end
end
