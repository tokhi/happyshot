class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  # GET /posts
  # GET /posts.json
  def index
    # http://www.sitepoint.com/infinite-scrolling-rails-basics/
    # @posts = Post.all.order('created_at DESC')
    @posts = Post.order('created_at DESC').page(params[:page])
    @post = Post.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.create(post_params)
    puts "params: #{params[:note]}"
    # image = Magick::ImageList.new
    # File.open('public/test.gif', 'wb') do|f|
    #   gif = image.from_blob(Base64.decode64(@post.image))
    #   # gif = Base64.decode64(@post.image).force_encoding('UTF-8').encode
    #   f.write(gif)
    # end
    # @post.image = "test.gif"
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_new_comment
    post = Post.find(params[:id])
    # post.comments << Post.new(params[:comment])
    # redirect_to :action => :show, :id => post


    # commentable = Post.create
    comment = post.comments.create
    comment.title = "First comment."
    comment.user = current_user
    comment.comment = params[:comment]
    comment.save
    redirect_to :action => :index

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id,:note,:tags,:image,:comment)
    end
end
