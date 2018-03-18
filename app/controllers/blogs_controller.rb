class BlogsController < ApplicationController
before_action :set_blog,only:[:show,:edit,:update,:destroy]

  def index
    @blogs = Blog.all.all.order("blogs.created_at desc")
  end

  def new
    @blog = Blog.new
  end

  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(blog_id: @blog.id)
      @comment = @blog.comments.build
      @comments = @blog.comments
    else
      redirect_to blogs_path, notice: "ログインしてください"
    end

  end

  def create
    if logged_in?
      @blog = Blog.new(blog_params)
      @blog.user_id = current_user.id
      if @blog.save
        BlogCreateMailer.blog_create_mail(current_user).deliver
        redirect_to blogs_path, notice:"作成しました"
      end
    else
        @blog = Blog.new(blog_params)
        redirect_to blogs_path, notice:"ログインしてください"
    end
  end

  def edit
  end

  def update
  if @blog.update(blog_params)
    redirect_to blogs_path, notice:"編集しました"
  else
    @blog = Blog.new(blog_params)
    render 'edit'
  end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path notice:"削除しました"
  end

  private
  def blog_params
    params.require(:blog).permit(:name,:title,:content)
  end

  def set_blog
   @blog = Blog.find(params[:id])
  end
end
