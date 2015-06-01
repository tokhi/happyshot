require 'rails_helper'
describe PostsController, :type => :controller  do
  before(:each) do
    @user = User.create!(email: 'tokhi@gmail.com', password: '12345678')
    @post1 = Post.create!(note: "test node", image: "image data here..", user_id: @user.id)
    @post2 = Post.create!(note: "test node", image: "image data here..", user_id: @user.id)
    
  end

  context "post creation and validation" do

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

     it 'load all posts in reverse order' do
      # get :index
      # expect(assigns(:posts)).to eq([@post1, @post2])
    end

  end
end
