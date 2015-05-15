class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :my_posts]

  # GET /posts
  # GET /posts.json
  def index
    # http://www.sitepoint.com/infinite-scrolling-rails-basics/
    # @posts = Post.all.order('created_at DESC')
    @posts = Post.order('created_at DESC').page(params[:page])
    @post = Post.new
    @favorite = Favorite.new
    respond_to do |format|
      format.html
      format.js
    end
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
    # image = Magick::ImageList.new
    # File.open('public/test.gif', 'wb') do|f|
    #   gif = image.from_blob(Base64.decode64(@post.image))
    #   # gif = Base64.decode64(@post.image).force_encoding('UTF-8').encode
    #   f.write(gif)
    # end
    # @post.image = "test.gif"
    redirect_to :action => :index
   
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

  def my_posts
    @posts = Post.where(:user_id=>current_user.id).order('created_at DESC').page(params[:page])
    @post = Post.new
    @favorite = Favorite.new
    render '/posts/index'
  end

  def add_new_comment
    @post = Post.find(params[:id])
    # post.comments << Post.new(params[:comment])
    # redirect_to :action => :show, :id => post
    # commentable = Post.create
    comment = @post.comments.create
    comment.user = current_user
    comment.comment = params[:comment]
    comment.save

    # redirect_to :action => :index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def dis_or_like
    puts "disor like route.............."
    @post = Post.find(params[:id])
   if @post.favorites.where(:user_id=>current_user.id).count > 0
       puts "if part.."
      @post.favorites.where(:user_id=>current_user.id)[0].delete
    else
      puts "else part..."
      current_user.favorites.create(:post_id => params[:id])
    end
    #  nasty against DRY
    # @posts = Post.order('created_at DESC').page(params[:page])
    # # @posts = Post.where(:id => post.id..post.id+20).order('created_at DESC')
    # @post = Post.new
    # @favorite = Favorite.new

    respond_to do |format|
      format.html
      format.js
    end   
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
