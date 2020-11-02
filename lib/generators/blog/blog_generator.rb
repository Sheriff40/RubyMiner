class BlogGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_blog_controller
    copy_file "blog_controller.rb", "app/controllers/posts_controller.rb"
  end

  def create_comment_controller
    copy_file "comment_controller.rb", "app/controllers/comments_controller.rb"
  end

  def create_user_like_controller
    copy_file "user_post_likes_controller.rb", "app/controllers/user_post_likes_controller.rb"
  end

  def create_blog_model
    copy_file "blog_model.rb", "app/model/post.rb"
  end

  def create_comment_model
    copy_file "comment.rb", "app/model/comment.rb"
  end

  def create_user_like_model
    copy_file "user_like_model.rb", "app/model/user_post_like.rb"
  end

  def new_post_page
    copy_file "blog_new.rb", "app/views/posts/new.html.slim"
  end

  def edit_post_page
    copy_file "blog_edit.rb", "app/views/posts/edit.html.slim"
  end

  def form_post_page
    copy_file "blog_form.rb", "app/views/posts/_form.html.slim"
  end

  def index_post_page
    copy_file "blog_index.rb", "app/views/posts/index.html.slim"
  end

  def show_post_page
    copy_file "blog_show.rb", "app/views/posts/show.html.slim"
  end

  def sidebar_post_page
    copy_file "blog_sidebar.rb", "app/views/posts/_blog_sidebar.html.slim"
  end

  def comment_new_page
    copy_file "comments_new.rb", "app/views/comments/_form.html.slim"
  end

  def blogs_javascript
    copy_file "blog_javascript.rb", "app/javascript/packs/posts.js"
  end

  def blogs_migration
    copy_file "blog_migration.rb", "db/migrate/create_posts.rb"
  end

  def comments_migration
    copy_file "comment_migration.rb", "db/migrate/create_comments.rb"
  end

  def user_post_likes_migration
    copy_file "user_post_like_migration.rb", "db/migrate/create_user_post_likes.rb"
  end
end