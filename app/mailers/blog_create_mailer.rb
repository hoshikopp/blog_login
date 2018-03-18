class BlogCreateMailer < ApplicationMailer
  def blog_create_mail(blog_create)
    @blog_create = blog_create
    mail to: @blog_create.email, subject:"ブログを投稿しました"
  end
end
